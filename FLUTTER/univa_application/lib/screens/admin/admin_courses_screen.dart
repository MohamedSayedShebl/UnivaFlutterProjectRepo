// screens/admin/admin_courses_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/routes.dart';
import '../../utils/constants.dart';
import '../../cubits/course/course_cubit.dart';
import '../../cubits/course/course_state.dart';
import '../../models/course.dart';

class AdminCoursesScreen extends StatefulWidget {
  const AdminCoursesScreen({super.key});

  @override
  State<AdminCoursesScreen> createState() => _AdminCoursesScreenState();
}

class _AdminCoursesScreenState extends State<AdminCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.primary),
            onPressed: () {
              _createNewCourse();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),

          // All Courses Header
          _buildAllCoursesHeader(),

          // Courses List
          Expanded(
            child: BlocBuilder<CourseCubit, CourseState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (courses) {
                    return _buildCoursesList(courses);
                  },
                  detail: (_) => const SizedBox.shrink(),
                  success: (_) {
                    context.read<CourseCubit>().fetchCourses();
                    return const SizedBox.shrink();
                  },
                  deleted: () {
                    context.read<CourseCubit>().fetchCourses();
                    return const SizedBox.shrink();
                  },
                  error: (msg) => Center(child: Text("Error: $msg")),
                );
              },
            ),
          ),

          // Build Navigation Bar
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search users by name, email, level, ID, rule',
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.border),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onChanged: (value) {
          setState(() {}); // trigger rebuild to filter list
        },
      ),
    );
  }


  Widget _buildAllCoursesHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: const Row(
        children: [
          Text(
            'All Courses',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesList(List<Course> courses) {
    final query = _searchController.text.toLowerCase();
    final filtered = courses.where((c) {
    final name = c.courseName?.toLowerCase() ?? '';
    final code = c.courseCode?.toLowerCase() ?? '';
    return name.contains(query) || code.contains(query);
    }).toList();

    if (filtered.isEmpty) {
      return const Center(child: Text("No courses found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final course = filtered[index];
        return _buildCourseCard(course, index);
      },
    );
  }

  Widget _buildCourseCard(Course course, int index) {
    return Container(
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Course Title
                Text(
                  course.courseName ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Course Code
                Text(
                  '${course.courseCode}',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),

                // Credits
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credits: ${course.creditHours}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Status Badge
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: (course.is_active ?? false) ? AppColors.primary : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      (course.is_active ?? false) ? "Active" : "Inactive",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Action Icons
          Positioned(
            top: 12,
            right: 12,
            child: Row(
              children: [
                // Delete
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 18, color: Colors.white),
                    onPressed: () {
                      _deleteCourse(course.id!);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                const SizedBox(width: 8),

                // Edit
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                    onPressed: () {
                      _editCourse(course.id!);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _deleteCourse(int id) {
    context.read<CourseCubit>().deleteCourse(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Course deleted")),
    );
  }

  void _editCourse(int id) {
    Navigator.pushNamed(
      context,
      AppRoutes.editCourse,
      arguments: {"courseId": id}, // pass the course ID
    ).then((result) {
      if (result == true) {
        // refresh course list if changes were made
        context.read<CourseCubit>().fetchCourses();
      }
    });
  }

  void _createNewCourse() {
    Navigator.pushNamed(context, AppRoutes.createCourse);
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 2, // Courses is selected
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Grades'),
        BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
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
        Navigator.pushNamed(context, AppRoutes.adminUsers);
        break;
      case 2:
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.adminGrades);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.adminSupport);
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
