// screens/student/student_course_detail_screen.dart
import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../../utils/constants.dart';
import '../../models/course.dart';

class StudentCourseDetailScreen extends StatefulWidget {
  final Course course;

  const StudentCourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  State<StudentCourseDetailScreen> createState() => _StudentCourseDetailScreenState();
}

class _StudentCourseDetailScreenState extends State<StudentCourseDetailScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Overview', 'Schedule', 'Materials', 'Assignments'];
  final List<bool> _weekExpansionStates = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBreadcrumbNavigation(),
          _buildCourseHeader(),
          _buildDescription(),
          _buildTabBar(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'My Courses',
        style: TextStyle(color: AppColors.textPrimary),
      ),
    );
  }

  Widget _buildBreadcrumbNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      color: Colors.white,
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Courses',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const TextSpan(
              text: ' > ',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            TextSpan(
              text: widget.course.courseCode ?? 'N/A',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const TextSpan(
              text: ' – ',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            TextSpan(
              text: widget.course.courseName ?? 'Course',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseHeader() {
    final creditHours = widget.course.creditHours != null
        ? '${widget.course.creditHours} Hr'
        : '3 Hr';
    final instructor = 'Instructor Name'; // Replace with real field if available
    final department = 'CS'; // Replace with real field if available

    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFE3F2FD),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.course.courseCode != null
                  ? Image.asset(
                      'assets/images/ai_course.png',
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.school, size: 40, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.course.courseName ?? 'Course Name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  instructor,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildInfoChip(creditHours),
                    const SizedBox(width: 8),
                    _buildInfoChip(department),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Text(
        widget.course.description ??
            'No description provided for this course.',
        style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_tabs.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTabIndex == index 
                          ? AppColors.primary 
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: _selectedTabIndex == index 
                        ? AppColors.primary 
                        : AppColors.textSecondary,
                    fontWeight: _selectedTabIndex == index 
                        ? FontWeight.w600 
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0: // Overview tab
        return _buildOverviewTab();
      case 1: // Schedule tab
        return _buildScheduleTab();
      case 2: // Materials tab
        return _buildMaterialsTab();
      case 3: // Assignments tab
        return _buildAssignmentsTab();
      default:
        return _buildOverviewTab();
    }
  }

  Widget _buildOverviewTab() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Modules',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildExpandableWeekCard(
              'Week 1 – Introduction to AI',
              [
                'Understand AI history & applications',
                'Recognize AI\'s role in modern technology',
                'Recognize AI\'s role in modern technology', // Duplicate as in screenshot
              ],
              0,
            ),
            const SizedBox(height: 16),
            _buildExpandableWeekCard(
              'Week 2 – Search Algorithms',
              [
                'Understand different search strategies',
                'Implement breadth-first and depth-first search',
                'Analyze search algorithm complexity',
              ],
              1,
            ),
            const SizedBox(height: 16),
            _buildExpandableWeekCard(
              'Week 3 – Knowledge Representation',
              [
                'Learn about knowledge representation techniques',
                'Understand propositional and predicate logic',
                'Explore semantic networks and frames',
              ],
              2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableWeekCard(String weekTitle, List<String> objectives, int weekIndex) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: _weekExpansionStates[weekIndex],
        onExpansionChanged: (expanded) {
          setState(() {
            _weekExpansionStates[weekIndex] = expanded;
          });
        },
        title: Text(
          weekTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Learning Objectives:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ...objectives.map((objective) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Using unchecked circle icon (will be checked by admin later)
                        const Icon(Icons.circle_outlined, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            objective,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleTab() {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Course schedule will be displayed here',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

Widget _buildMaterialsTab() {
  // Sample materials data (removed isCompleted field)
  final List<Map<String, dynamic>> week1Materials = [
    {
      'title': 'Lecture 1: Course Overview',
      'type': 'Video',
      'uploadDate': 'Sep 1, 2024',
    },
    {
      'title': 'Lecture Slides: Introduction',
      'type': 'Document',
      'uploadDate': 'Sep 1, 2024',
    },
  ];

  final List<Map<String, dynamic>> week2Materials = [
    {
      'title': 'Lecture 2: Data Structures',
      'type': 'Video',
      'uploadDate': 'Sep 8, 2024',
    },
    {
      'title': 'Lecture Slides: Data Structures',
      'type': 'Document',
      'uploadDate': 'Sep 8, 2024',
    },
  ];

  return Container(
    color: Colors.white,
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMaterialsSection('Week 1: Introduction', week1Materials),
          const SizedBox(height: 24),
          _buildMaterialsSection('Week 2: Core Concepts', week2Materials),
        ],
      ),
    ),
  );
}

Widget _buildMaterialsSection(String weekTitle, List<Map<String, dynamic>> materials) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        weekTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 16),
      ...materials.map((material) {
        return _buildMaterialItem(
          material['title'],
          material['type'],
          material['uploadDate'],
        );
      }).toList(),
    ],
  );
}

  Widget _buildMaterialItem(String title, String type, String uploadDate) {
    IconData icon;
    Color iconColor;
    
    // Set icon based on material type
    switch (type) {
      case 'Video':
        icon = Icons.video_library;
        iconColor = Colors.red;
        break;
      case 'Document':
        icon = Icons.description;
        iconColor = Colors.blue;
        break;
      case 'PDF':
        icon = Icons.picture_as_pdf;
        iconColor = Colors.red;
        break;
      case 'Audio':
        icon = Icons.audiotrack;
        iconColor = Colors.purple;
        break;
      default:
        icon = Icons.insert_drive_file;
        iconColor = AppColors.textSecondary;
    }

    return GestureDetector(
      onTap: () {
        // This will be used later to open the material
        _openMaterial(title, type);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
            // Material icon (replaced checkbox with icon)
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            // Material details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Uploaded: $uploadDate',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openMaterial(String title, String type) {
    // This will be implemented later to open the actual material
    print('Opening $type: $title');
    // You can implement navigation to a video player, document viewer, etc.
  }

  Widget _buildAssignmentsTab() {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Assignments will be displayed here',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Courses is selected
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
      ),
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0: // Home
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1: // Courses - Navigate back to courses screen
        Navigator.pop(context);
        break;
      case 2: // Grades
        Navigator.pushNamed(context, AppRoutes.studentGrades);
        break;
      case 3: // Support
        Navigator.pushNamed(context, AppRoutes.studentSupport);
        break;
      case 4: // Profile
        Navigator.pushNamed(context, AppRoutes.studentProfile);
        break;
    }
  }
}