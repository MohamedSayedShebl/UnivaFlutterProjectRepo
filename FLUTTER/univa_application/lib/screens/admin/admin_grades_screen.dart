// screens/admin/admin_grades_screen.dart
import 'package:flutter/material.dart';
import 'dart:io';
import '../../app/routes.dart';
import '../../utils/constants.dart';

class AdminGradesScreen extends StatefulWidget {
  const AdminGradesScreen({super.key});

  @override
  State<AdminGradesScreen> createState() => _AdminGradesScreenState();
}

class _AdminGradesScreenState extends State<AdminGradesScreen> {
  File? _selectedFile;
  String? _selectedStudentIdColumn;
  String? _selectedAssignmentColumn;
  String? _selectedGradeColumn;
  
  final List<String> _csvColumns = [
    'student_id',
    'student_name',
    'assignment_1',
    'assignment_2',
    'midterm',
    'final_exam',
    'total_grade',
    'letter_grade'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Grades'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upload File Section
            _buildUploadSection(),
            const SizedBox(height: 24),
            
            // Column Mapping Section
            if (_selectedFile != null) _buildColumnMappingSection(),
            
            // Action Buttons
            _buildActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload File',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        
        // Drag and Drop Area
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(
              color: _selectedFile != null ? AppColors.primary : AppColors.border,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _selectedFile != null
              ? _buildFilePreview()
              : _buildDragDropArea(),
        ),
      ],
    );
  }

  Widget _buildDragDropArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.cloud_upload,
          size: 48,
          color: AppColors.textSecondary,
        ),
        const SizedBox(height: 16),
        const Text(
          'Drag and drop CSV file here',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Or browse to upload',
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _selectFile,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Browse Files'),
        ),
      ],
    );
  }

  Widget _buildFilePreview() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.description,
          size: 48,
          color: AppColors.primary,
        ),
        const SizedBox(height: 16),
        Text(
          _selectedFile!.path.split('/').last,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          '${(_selectedFile!.lengthSync() / 1024).toStringAsFixed(1)} KB',
          style: const TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _selectFile,
          child: const Text('Choose Different File'),
        ),
      ],
    );
  }

  Widget _buildColumnMappingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Map CSV Columns',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        
        // Student ID Column
        _buildColumnDropdown(
          label: 'Student ID',
          value: _selectedStudentIdColumn,
          onChanged: (value) {
            setState(() {
              _selectedStudentIdColumn = value;
            });
          },
        ),
        const SizedBox(height: 16),
        
        // Assignment Name Column
        _buildColumnDropdown(
          label: 'Assignment Name',
          value: _selectedAssignmentColumn,
          onChanged: (value) {
            setState(() {
              _selectedAssignmentColumn = value;
            });
          },
        ),
        const SizedBox(height: 16),
        
        // Grade Column
        _buildColumnDropdown(
          label: 'Grade',
          value: _selectedGradeColumn,
          onChanged: (value) {
            setState(() {
              _selectedGradeColumn = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildColumnDropdown({
    required String label,
    required String? value,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
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
              items: _csvColumns.map((String column) {
                return DropdownMenuItem<String>(
                  value: column,
                  child: Text(column),
                );
              }).toList(),
              onChanged: onChanged,
              isExpanded: true,
              hint: const Text('Select CSV Column'),
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: AppColors.border),
              ),
              child: const Text('Cancel'),
            ),
          ),
          const SizedBox(width: 16),
          
          // Upload Button
          Expanded(
            child: ElevatedButton(
              onPressed: _selectedFile != null ? _uploadGrades : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Upload',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 3, // Grades is selected
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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

  void _selectFile() async {
    setState(() {
      _selectedFile = File('/path/to/sample/grades');
      
      // Set default column mappings
      _selectedStudentIdColumn = 'student_id';
      _selectedAssignmentColumn = 'assignment_1';
      _selectedGradeColumn = 'total_grade';
    });
    
    // For a real implementation
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['csv'],
    // );
    // if (result != null) {
    //   setState(() {
    //     _selectedFile = File(result.files.single.path!);
    //   });
    // }
  }

  void _uploadGrades() {
    if (_selectedStudentIdColumn == null ||
        _selectedAssignmentColumn == null ||
        _selectedGradeColumn == null) {
      _showErrorDialog('Please map all required columns');
      return;
    }
    
    // Simulate upload process
    print('Uploading grades with mapping:');
    print('Student ID: $_selectedStudentIdColumn');
    print('Assignment: $_selectedAssignmentColumn');
    print('Grade: $_selectedGradeColumn');
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Grades uploaded successfully!'),
        backgroundColor: Colors.amber,
      )
    );
    
    // Navigate back or clear form
    setState(() {
      _selectedFile = null;
      _selectedStudentIdColumn = null;
      _selectedAssignmentColumn = null;
      _selectedGradeColumn = null;
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

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0: // Home
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1: // Users
        Navigator.pushNamed(context, AppRoutes.adminUsers);
        break;
      case 2: // Courses
        Navigator.pushNamed(context, AppRoutes.adminCourses);
        break;
      case 3: // Grades
        // Already on grades screen
        break;
      case 4: // Support
        Navigator.pushNamed(context, AppRoutes.adminSupport);
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}