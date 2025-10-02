import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/routes.dart';
import '../../cubits/enrollment/enrollment_cubit.dart';
import '../../cubits/enrollment/enrollment_state.dart';
import '../../cubits/login/login_cubit.dart';
import '../../models/enrollment.dart';
import '../../utils/constants.dart';

class StudentCoursesScreen extends StatefulWidget {
  const StudentCoursesScreen({super.key});

  @override
  State<StudentCoursesScreen> createState() => _StudentCoursesScreenState();
}

class _StudentCoursesScreenState extends State<StudentCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _assignments = [
    {
      'title': 'Career Fair Lab 7',
      'dueDate': '05 May - 11:59',
    },
    {
      'title': 'Career Fair Lab 7',
      'dueDate': '05 May - 11:59',
    },
  ];

  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Completed', 'Current', 'Done'];

  // Helper method for assignment colors
  Map<String, Color> _getAssignmentColors(int index) {
    final isEvenIndex = index % 2 == 0;
    
    return {
      'backgroundColor': isEvenIndex ? AppColors.primary : Colors.white,
      'textColor': isEvenIndex ? Colors.white : AppColors.primary,
      'iconBackgroundColor': isEvenIndex 
          ? Colors.white.withOpacity(0.2) 
          : AppColors.primary.withOpacity(0.1),
      'iconColor': isEvenIndex ? Colors.white : AppColors.primary,
    };
  }

  @override
  void initState() {
    super.initState();
    _loadStudentEnrollments();
  }

  void _loadStudentEnrollments() {
    final loginCubit = context.read<LoginCubit>();
    final studentIdStr = loginCubit.studentId;
    final studentId = int.tryParse(studentIdStr ?? "0");
    
    if (studentId != null && studentId != 0) {
      context.read<EnrollmentCubit>().fetchAllEnrollments(studentId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildFilterSection(),
            const SizedBox(height: 20),
            // Enrollments List
            BlocConsumer<EnrollmentCubit, EnrollmentState>(
              listener: (context, state) {
                // Handle state changes if needed
              },
              builder: (context, state) {
                return state.when(
                  initial: () => Container(
                    height: 200,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  loading: () => Container(
                    height: 200,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  loaded: (enrollments) {
                    return _buildEnrollmentsList(enrollments);
                  },
                  loadedSections: (_) => Container(
                    height: 200,
                    child: const Center(child: Text("Wrong state - please reload")),
                  ),
                  detail: (_) => const SizedBox.shrink(),
                  success: (_) {
                    // Reload enrollments after success
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _loadStudentEnrollments();
                    });
                    return const SizedBox.shrink();
                  },
                  deleted: () {
                    // Reload enrollments after deletion
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _loadStudentEnrollments();
                    });
                    return const SizedBox.shrink();
                  },
                  error: (msg) => Container(
                    height: 200,
                    child: Center(child: Text("Error: $msg")),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildAssignmentsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.card,
      foregroundColor: AppColors.textPrimary,
      elevation: 1,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.amber[600],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, size: 20, color: Colors.white),
          ),
          onPressed: () {
            _enrollInCourse();
          },
        ),
        const SizedBox(width: 16)
      ],
    );
  }

  void _enrollInCourse() {
    Navigator.pushNamed(context, AppRoutes.courseEnrollment);
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ChoiceChip(
              label: Text(_filters[index]),
              selected: _selectedFilterIndex == index,
              selectedColor: AppColors.primary,
              onSelected: (selected) {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
              labelStyle: TextStyle(
                color: _selectedFilterIndex == index ? Colors.white : AppColors.textSecondary,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEnrollmentsList(List<Enrollment> enrollments) {
    final query = _searchController.text.toLowerCase();
    final filtered = enrollments.where((enrollment) {
      final course = enrollment.section?.course;
      final name = course?.courseName?.toLowerCase() ?? '';
      final code = course?.courseCode?.toLowerCase() ?? '';
      return name.contains(query) || code.contains(query);
    }).toList();

    if (filtered.isEmpty) {
      return Container(
        height: 200,
        child: const Center(child: Text("No enrolled courses found")),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final enrollment = filtered[index];
        return _buildEnrollmentCard(enrollment, index);
      },
    );
  }

  Widget _buildEnrollmentCard(Enrollment enrollment, int index) {
    final course = enrollment.section?.course;
    
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course?.courseName ?? 'No Name',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(course?.courseCode ?? '',
                style: TextStyle(fontSize: 14, color: AppColors.primary)),
            const SizedBox(height: 8),
            Text('Credits: ${course?.creditHours ?? 3}',
                style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(enrollment.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    enrollment.status ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'Section: ${enrollment.section?.sectionNumber ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'enrolled':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'dropped':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildAssignmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assignments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _assignments.length,
            itemBuilder: (ctx, index) {
              final assignment = _assignments[index];
              final colors = _getAssignmentColors(index);
              
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors['backgroundColor'],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colors['backgroundColor'] == Colors.white 
                        ? AppColors.border 
                        : Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: colors['iconBackgroundColor'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.assignment,
                        size: 20, 
                        color: colors['iconColor'],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            assignment['title'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: colors['textColor'],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            assignment['dueDate'],
                            style: TextStyle(
                              fontSize: 10,
                              color: colors['backgroundColor'] == AppColors.primary
                                  ? Colors.white.withOpacity(0.8)
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Grades'),
        BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        _navigateToScreen(index, context);
      },
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
        // Already on courses screen
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.studentGrades);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.studentSupport);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.studentProfile);
        break;
    }
  }
}