import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/event.dart';
import '../../cubits/event/event_cubit.dart';
import '../../cubits/event/event_state.dart';

class StudentEventDetailScreen extends StatefulWidget {
  final int eventId;
  const StudentEventDetailScreen({super.key, required this.eventId});

  @override
  State<StudentEventDetailScreen> createState() => _StudentEventDetailScreenState();
}

class _StudentEventDetailScreenState extends State<StudentEventDetailScreen> {
  bool _isEditing = false;

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _typeController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().fetchEvent(widget.eventId);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //ensures we notify home on back navigation
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Event Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: BlocConsumer<EventCubit, EventState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (event) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Event updated")),
                );
              },
              deleted: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Event deleted")),
                );
                Navigator.pop(context, true);
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
              detail: (event) => _buildDetailOrEdit(event),
              success: (event) => _buildDetailOrEdit(event),
              error: (msg) => Center(child: Text(msg)),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailOrEdit(Event event) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isEditing
              ? TextField(controller: _titleController, decoration: const InputDecoration(labelText: "Title"))
              : Text(event.title ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _descController, decoration: const InputDecoration(labelText: "Description"))
              : Text(event.description ?? ''),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _typeController, decoration: const InputDecoration(labelText: "Type"))
              : Text("Type: ${event.eventType ?? ''}"),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _startDateController, decoration: const InputDecoration(labelText: "Start Date"))
              : Text("Start: ${event.startDate ?? ''}"),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _endDateController, decoration: const InputDecoration(labelText: "End Date"))
              : Text("End: ${event.endDate ?? ''}"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _typeController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}
