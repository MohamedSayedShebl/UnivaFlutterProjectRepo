// lib/screens/admin/create_user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/routes.dart';
import '../../utils/constants.dart';
import '../../cubits/create_user/create_user_cubit.dart';
import '../../cubits/create_user/create_user_state.dart';

class AdminCreateUserScreen extends StatefulWidget {
  const AdminCreateUserScreen({super.key});

  @override
  State<AdminCreateUserScreen> createState() => _AdminCreateUserScreenState();
}

class _AdminCreateUserScreenState extends State<AdminCreateUserScreen> {
  int _selectedTab = 0;

  // Basic user fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Common fields for both student and faculty
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Student-specific fields
  final TextEditingController _gpaController = TextEditingController();
  final TextEditingController _totalCreditsController = TextEditingController();

  // Faculty-specific fields
  final TextEditingController _positionController = TextEditingController();

  String? _selectedRole;
  String? _selectedDepartment;
  String? _selectedLevel;

  final Map<String, String> _roles = {
    'student': 'Student',
    'faculty': 'Faculty',
    'admin': 'Administrator',
  };

  final List<String> _departments = [
    'Computer Science',
    'Business Administration',
    'Engineering',
    'Health Sciences',
    'Arts & Humanities',
    'Social Sciences',
    'general'
  ];

  final List<String> _levels = [
    'First',
    'Second',
    'Third',
    'Fourth',
  ];


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _dateOfBirthController.dispose();
    _addressController.dispose();
    _gpaController.dispose();
    _totalCreditsController.dispose();
    _positionController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add New User'),
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.textPrimary,
          elevation: 1,
        ),
        body: Column(
          children: [
            _buildCustomTabBar(),
            Expanded(
              child: _selectedTab == 0
                  ? _buildPersonalInfoTab()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      );
  }

  Widget _buildCustomTabBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _selectedTab == 0 ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: _selectedTab == 0 ? AppColors.primary : AppColors.border,
                  ),
                ),
                child: Text(
                  'Personal Info',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _selectedTab == 0 ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoTab() {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User created successfully!'), backgroundColor: Colors.green),
            );
            Navigator.pop(context);
          },
          failure: (message) {
            _showErrorDialog(message);
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic user info
              _buildFormField(label: 'Name', hint: 'Enter full name', controller: _nameController),
              const SizedBox(height: 16),
              _buildFormField(
                label: 'Email',
                hint: 'Enter email address',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: 'Role',
                value: _selectedRole,
                items: _roles.keys.toList(),
                onChanged: (value) => setState(() => _selectedRole = value),
                friendlyLabels: _roles,
              ),
              const SizedBox(height: 16),
              
              _buildFormField(
                label: 'Date of Birth',
                hint: 'YYYY-MM-DD',
                controller: _dateOfBirthController,
              ),
              const SizedBox(height: 16),              
              
              _buildFormField(
                label: 'Password',
                hint: 'Create password',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),

              // Student-specific fields (only show when role is student)
              if (_selectedRole == 'student') ...[
                _buildFormField(
                  label: 'Phone',
                  hint: 'Enter phone number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Address',
                  hint: 'Enter address',
                  controller: _addressController,
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: 'Level',
                  value: _selectedLevel,
                  items: _levels,
                  onChanged: (value) => setState(() => _selectedLevel = value),
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'GPA',
                  hint: 'Enter GPA (e.g., 3.5)',
                  controller: _gpaController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _buildFormField(
                  label: 'Total Credits',
                  hint: 'Enter total credits',
                  controller: _totalCreditsController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
              ],

              // Faculty-specific fields (only show when role is faculty)
              if (_selectedRole == 'faculty') ...[
                _buildFormField(
                  label: 'Position',
                  hint: 'Enter position (e.g., Professor, Lecturer)',
                  controller: _positionController,
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: 'Department',
                  value: _selectedDepartment,
                  items: _departments,
                  onChanged: (value) => setState(() => _selectedDepartment = value),
                ),
                const SizedBox(height: 16),
              ],

              // Admin-specific fields (only show when role is admin)
              if (_selectedRole == 'admin') ...[
                _buildDropdown(
                  label: 'Department',
                  value: _selectedDepartment,
                  items: _departments,
                  onChanged: (value) => setState(() => _selectedDepartment = value),
                ),
                const SizedBox(height: 16),
              ],

              // Save buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: AppColors.border),
                      ),
                      child: const Text('Cancel', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () => _onSavePressed(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text(
                              'Save',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  void _onSavePressed(BuildContext context) {
    // Basic validation
    if (_nameController.text.isEmpty) {
      _showErrorDialog('Name is required');
      return;
    }
    if (_emailController.text.isEmpty) {
      _showErrorDialog('Email is required');
      return;
    }
    if (_passwordController.text.isEmpty) {
      _showErrorDialog('Password is required');
      return;
    }
    if (_selectedRole == null) {
      _showErrorDialog('Please select a role');
      return;
    }

    // Student-specific validation
    if (_selectedRole == 'student') {
      if (_phoneController.text.isEmpty) {
        _showErrorDialog('Please enter phone number for the student');
        return;
      }
      if (_addressController.text.isEmpty) {
        _showErrorDialog('Please enter address for the student');
        return;
      }
      if (_selectedLevel == null) {
        _showErrorDialog('Please select a level for the student');
        return;
      }
      if (_gpaController.text.isEmpty) {
        _showErrorDialog('Please enter GPA for the student');
        return;
      }
      if (_totalCreditsController.text.isEmpty) {
        _showErrorDialog('Please enter total credits for the student');
        return;
      }
    }

    // Faculty-specific validation
    if (_selectedRole == 'faculty') {
      if (_positionController.text.isEmpty) {
        _showErrorDialog('Please enter position for the faculty');
        return;
      }
      if (_selectedDepartment == null) {
        _showErrorDialog('Please select a department for the faculty');
        return;
      }
    }

    // Admin-specific validation
    if (_selectedRole == 'admin') {
      if (_selectedDepartment == null) {
        _showErrorDialog('Please select a department for the admin');
        return;
      }
    }

    final cubit = context.read<CreateUserCubit>();
    cubit.createUser(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      passwordConfirmation: _passwordController.text,
      role: _selectedRole!,
      phone: _selectedRole == 'student' ? _phoneController.text : null,
      dateOfBirth: _dateOfBirthController.text.isNotEmpty ? _dateOfBirthController.text : null,
      address: _selectedRole == 'student' ? _addressController.text : null,
      position: _selectedRole == 'faculty' ? _positionController.text : null,
      department: (_selectedRole == 'faculty' || _selectedRole == 'admin') ? _selectedDepartment : null,
      level: _selectedRole == 'student' ? _selectedLevel : null,
      gpa: _selectedRole == 'student' ? _gpaController.text : null,
      totalCredits: _selectedRole == 'student' ? _totalCreditsController.text : null,
    );
  }

  Widget _buildFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    Map<String, String>? friendlyLabels,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    friendlyLabels != null ? friendlyLabels[item]! : item,
                    style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              isExpanded: true,
              hint: Text('Select $label', style: const TextStyle(color: AppColors.textSecondary)),
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
              icon: const Icon(Icons.arrow_drop_down, color: AppColors.textPrimary),
              dropdownColor: Colors.white,
            ),
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
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Grades'),
        BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.adminHome);
            break;
          case 1:
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.adminCourses);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.adminGrades);
            break;
          case 4:
            Navigator.pushReplacementNamed(context, AppRoutes.adminSupport);
            break;
        }
      },
    );
  }
}