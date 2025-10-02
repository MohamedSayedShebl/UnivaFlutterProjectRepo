// lib/screens/admin/admin_course_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/course/course_cubit.dart';
import '../../cubits/course/course_state.dart';
import '../../models/course.dart';

class CourseDetailScreen extends StatefulWidget {
  final int courseId;
  const CourseDetailScreen({super.key, required this.courseId});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool _isEditing = false;
  bool _active = false; // <-- tracks active state

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _descController = TextEditingController();
  final _creditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().fetchCourse(widget.courseId);
  }

  void _toggleEdit(Course course) {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _nameController.text = course.courseName ?? "";
        _codeController.text = course.courseCode ?? "";
        _descController.text = course.description ?? "";
        _creditController.text = course.creditHours?.toString() ?? "";
        _active = course.is_active ?? false;
      }
    });
  }

  void _saveChanges() {
    final data = {
      "course_name": _nameController.text,
      "course_code": _codeController.text,
      "description": _descController.text,
      "credit_hours": int.tryParse(_creditController.text) ?? 0,
      "is_active": _active,
    };
    context.read<CourseCubit>().updateCourse(widget.courseId, data);
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, true),
        ),
        actions: [
          BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              return state.maybeWhen(
                detail: (course) => IconButton(
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      _toggleEdit(course);
                    }
                  },
                ),
                success: (course) => IconButton(
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      _toggleEdit(course);
                    }
                  },
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (course) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Course updated")),
              );
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: $msg")),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            detail: (course) => _buildDetailOrEdit(course),
            success: (course) => _buildDetailOrEdit(course),
            error: (msg) => Center(child: Text(msg)),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildDetailOrEdit(Course course) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isEditing
              ? TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Course Name"))
              : Text(course.courseName ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _codeController, decoration: const InputDecoration(labelText: "Course Code"))
              : Text(course.courseCode ?? '', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _descController, decoration: const InputDecoration(labelText: "Description"))
              : Text(course.description ?? ''),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _creditController, decoration: const InputDecoration(labelText: "Credit Hours"))
              : Text("Credits: ${course.creditHours ?? 0}"),
          const SizedBox(height: 12),
          _isEditing
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Active", style: TextStyle(fontSize: 16)),
                    Switch(
                      value: _active,
                      onChanged: (val) => setState(() => _active = val),
                    ),
                  ],
                )
              : Text(
                  course.is_active == true ? "Status: Active" : "Status: Inactive",
                  style: TextStyle(
                    color: course.is_active == true ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _descController.dispose();
    _creditController.dispose();
    super.dispose();
  }
}
