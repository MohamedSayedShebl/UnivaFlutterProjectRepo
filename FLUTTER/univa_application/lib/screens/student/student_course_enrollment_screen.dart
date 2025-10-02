import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/enrollment/enrollment_cubit.dart';
import '../../cubits/enrollment/enrollment_state.dart';
import '../../cubits/login/login_cubit.dart';
import '../../models/available_section.dart';
import '../../models/course.dart';
import '../../utils/constants.dart';

class CourseEnrollmentScreen extends StatefulWidget {
  const CourseEnrollmentScreen({super.key});

  @override
  State<CourseEnrollmentScreen> createState() => _CourseEnrollmentScreenState();
}

class _CourseEnrollmentScreenState extends State<CourseEnrollmentScreen> {
  Map<int, bool> _selectedCourses = {}; // sectionId -> enrolled
  Map<int, Course> _courseMap = {};      // sectionId -> course object
  int _totalCredits = 0;
  bool _isSubmitting = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EnrollmentCubit>().fetchAvailableEnrollments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: BlocConsumer<EnrollmentCubit, EnrollmentState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (enrollment) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Enrollments created successfully!")),
              );
              _resetSelection();
              context.read<EnrollmentCubit>().fetchAvailableEnrollments();
            },
            error: (msg) {
              if (msg.toLowerCase().contains("already enrolled")) {
                // Treat as partial success
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Some courses were already enrolled — new ones added successfully."),
                  ),
                );
                _resetSelection();
                context.read<EnrollmentCubit>().fetchAvailableEnrollments();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $msg")),
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => _buildLoading(),
            loading: () => _buildLoading(),
            loadedSections: (sections) {
              _prepareSections(sections);
              return _buildContent();
            },
            error: (msg) => Center(child: Text("Error: $msg")),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _prepareSections(List<AvailableSection> sections) {
    for (var section in sections) {
      final course = section.course;
      final sectionId = section.sectionId;
      if (sectionId == -1) continue;
      if (course != null) {
        _courseMap[sectionId] = Course(
          id: sectionId,
          courseName: course.courseName ?? "Unnamed Course",
          courseCode: course.courseCode ?? "N/A",
          creditHours: course.creditHours ?? 0,
        );
        _selectedCourses.putIfAbsent(sectionId, () => false);
        debugPrint('Added course: ${course.courseName}');
      }
    }
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
    title: const Text("Course Enrollment"),
    backgroundColor: Colors.white,
    foregroundColor: AppColors.textPrimary,
    elevation: 1,
  );

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildContent() {
    final query = _searchController.text.toLowerCase();
    final filteredCourses = _courseMap.values.where((c) {
      final name = c.courseName?.toLowerCase() ?? '';
      final code = c.courseCode?.toLowerCase() ?? '';
      return name.contains(query) || code.contains(query);
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          ...filteredCourses.map(_buildCourseCard).toList(),
          const SizedBox(height: 24),
          _buildTotalCredits(),
          const SizedBox(height: 16),
          _buildEnrollButton(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() => TextField(
    controller: _searchController,
    decoration: InputDecoration(
      hintText: "Search courses...",
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onChanged: (_) => setState(() {}),
  );

  Widget _buildCourseCard(Course course) {
    final enrolled = _selectedCourses[course.id ?? -1] ?? false;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: enrolled ? Colors.green[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.courseName ?? "Unnamed Course",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Credits: ${course.creditHours ?? 0}"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _toggleCourse(course),
            style: ElevatedButton.styleFrom(
              backgroundColor: enrolled ? Colors.grey : AppColors.primary,
              foregroundColor: enrolled ? Colors.white : Colors.white,
            ),
            child: Text(enrolled ? "Drop" : "Enroll"),
          ),
        ],
      ),
    );
  }

  void _toggleCourse(Course course) {
    final id = course.id ?? -1;
    if (id == -1) return; // invalid id, skip

    setState(() {
      final enrolled = _selectedCourses[id] ?? false;
      _selectedCourses[id] = !enrolled;
      _totalCredits += enrolled ? -(course.creditHours ?? 0) : (course.creditHours ?? 0);
    });
  }

  Widget _buildTotalCredits() => Align(
    alignment: Alignment.centerRight,
    child: Text("Total Credits: $_totalCredits Hr",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
  );

  Widget _buildEnrollButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: _isSubmitting ? null : _submitEnrollments,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: _isSubmitting
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text("Enroll", style: TextStyle(color: Colors.white)),
    ),
  );

  void _submitEnrollments() async {
    final loginCubit = context.read<LoginCubit>();
    final studentIdStr = loginCubit.studentId; // username from login
    final studentId = int.tryParse(studentIdStr ?? "0"); // convert to int

    if (studentId == null || studentId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid student ID!"))
      );
      return;
    }

    final selected = _selectedCourses.entries
        .where((e) => e.value)
        .map((e) => {
              'student_id': studentId,        
              'section_id': e.key,
              'status': 'Enrolled',
              'enrollment_date': DateTime.now().toIso8601String(),
            })
        .toList();

    if (selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No courses selected for enrollment"))
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await context.read<EnrollmentCubit>().createEnrollments(selected);
      _resetSelection();
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _resetSelection() {
    setState(() {
      _selectedCourses.updateAll((key, value) => false);
      _totalCredits = 0;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}