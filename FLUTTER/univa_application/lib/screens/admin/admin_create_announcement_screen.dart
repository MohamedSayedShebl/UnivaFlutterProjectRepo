// screens/admin/create_announcement_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';
import '../../cubits/announcement/announcement_cubit.dart';
import '../../cubits/announcement/announcement_state.dart';
import '../../cubits/event/event_cubit.dart';
import '../../cubits/event/event_state.dart';

class CreateAnnouncementScreen extends StatefulWidget {
  const CreateAnnouncementScreen({super.key});

  @override
  State<CreateAnnouncementScreen> createState() =>
      _CreateAnnouncementScreenState();
}

class _CreateAnnouncementScreenState extends State<CreateAnnouncementScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Announcement', 'Event'];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedAudience = 'All Students';
  final List<String> _audienceOptions = [
    'All Students',
    'Faculty Only',
    'Specific Course',
    'Department'
  ];

  String? _selectedDepartment;
  String? _selectedCourse;

  final List<String> _departments = [
    'Computer Science',
    'Business Administration',
    'Engineering',
    'Health Sciences',
    'Arts & Humanities',
    'Social Sciences'
  ];

  final Map<String, List<String>> _departmentCourses = {
    'Computer Science': [
      'Introduction to Programming',
      'Data Structures',
      'Algorithms',
      'Database Systems',
      'Web Development',
      'Machine Learning'
    ],
    'Business Administration': [
      'Principles of Management',
      'Marketing Fundamentals',
      'Financial Accounting',
      'Business Ethics',
      'Strategic Management'
    ],
    'Engineering': [
      'Calculus I',
      'Physics for Engineers',
      'Statics',
      'Thermodynamics',
      'Circuit Analysis'
    ],
    'Health Sciences': [
      'Anatomy & Physiology',
      'Medical Terminology',
      'Public Health',
      'Nutrition Science',
      'Pharmacology'
    ],
    'Arts & Humanities': [
      'Art History',
      'World Literature',
      'Philosophy',
      'Music Theory',
      'Creative Writing'
    ],
    'Social Sciences': [
      'Introduction to Psychology',
      'Sociology',
      'Political Science',
      'Economics',
      'Anthropology'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // 🔹 Listen for AnnouncementCubit state changes
        BlocListener<AnnouncementCubit, AnnouncementState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) {
                _showSnack("Announcement created successfully!");
                _clearFields();
                Navigator.pop(context); // Go back to admin home
                context.read<AnnouncementCubit>().fetchAnnouncements();
              },
              error: (msg) => _showSnack("Error: $msg"),
            );
          },
        ),
        // 🔹 Listen for EventCubit state changes
        BlocListener<EventCubit, EventState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) {
                _showSnack("Event created successfully!");
                _clearFields();
                Navigator.pop(context); // Go back to admin home
                context.read<EventCubit>().fetchEvents();
              },
              error: (msg) => _showSnack("Error: $msg"),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create New'),
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.textPrimary,
          elevation: 1,
        ),
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: _buildSelectedTabContent(),
            ),
          ],
        ),
        bottomNavigationBar: _buildActionButtons(),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _selectedTabIndex == index
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null) {
    setState(() {
      _selectedDate = picked;
    });
  }
}

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    setState(() {
      _selectedTime = picked;
    });
  }
}
  Widget _buildSelectedTabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel("Title"),
          TextField(
            controller: _titleController,
            decoration: _inputDecoration("Enter title"),
          ),
          const SizedBox(height: 16),
          _buildLabel("Description"),
          TextField(
            controller: _descriptionController,
            maxLines: 5,
            decoration: _inputDecoration("Enter description"),
          ),
          const SizedBox(height: 16),
          _buildLabel("Audience"),
          DropdownButtonFormField<String>(
            value: _selectedAudience,
            items: _audienceOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedAudience = newValue!;
              });
            },
            decoration: _inputDecoration("Select Audience"),
          ),
          const SizedBox(height: 16),
          _buildLabel("Department"),
          DropdownButtonFormField<String>(
            value: _selectedDepartment,
            items: _departments.map((String department) {
              return DropdownMenuItem<String>(
                value: department,
                child: Text(department),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue;
                _selectedCourse = null;
              });
            },
            decoration: _inputDecoration("Select Department"),
          ),
          const SizedBox(height: 16),
          if (_selectedDepartment != null) ...[
            _buildLabel("Course"),
            DropdownButtonFormField<String>(
              value: _selectedCourse,
              items: _departmentCourses[_selectedDepartment]!
                  .map((String course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCourse = newValue;
                });
              },
              decoration: _inputDecoration("Select Course"),
            ),
            const SizedBox(height: 16),
          ],
          if (_selectedTabIndex == 1) ...[
            _buildLabel("Date & Time"),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectDate(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: AppColors.border),
                    ),
                    child: Text(
                      _selectedDate != null
                          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                          : 'Select Date',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectTime(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: AppColors.border),
                    ),
                    child: Text(
                      _selectedTime != null
                          ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
                          : 'Select Time',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildLabel("Location"),
            TextField(
              controller: _locationController,
              decoration: _inputDecoration("Enter event location"),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: AppColors.border),
              ),
              child: const Text('Cancel'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _saveContent,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Publish',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void _saveContent() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      _showErrorDialog("Title and Description are required");
      return;
    }

    if (_selectedTabIndex == 0) {
      final data = {
        "title": _titleController.text,
        "content": _descriptionController.text,
        "course_section_id": _selectedCourse != null ? 1 : null,
      };
      context.read<AnnouncementCubit>().createAnnouncement(data);
    } else {
      if (_selectedDate == null || _selectedTime == null) {
        _showErrorDialog("Please select date and time for the event");
        return;
      }

      final startDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      final data = {
        "title": _titleController.text,
        "description": _descriptionController.text,
        "location": _locationController.text,
        "start_date": startDateTime.toIso8601String(),
        "end_date": startDateTime.add(const Duration(hours: 2)).toIso8601String(),
        "event_type": "general",
      };

      context.read<EventCubit>().createEvent(data);
    }
  }

  void _clearFields() {
    _titleController.clear();
    _descriptionController.clear();
    _locationController.clear();
    setState(() {
      _selectedDate = null;
      _selectedTime = null;
      _selectedDepartment = null;
      _selectedCourse = null;
      _selectedAudience = 'All Students';
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildLabel(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
