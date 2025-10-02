import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/event.dart';
import '../../cubits/event/event_cubit.dart';
import '../../cubits/event/event_state.dart';

class AdminEventDetailScreen extends StatefulWidget {
  final int eventId;
  const AdminEventDetailScreen({super.key, required this.eventId});

  @override
  State<AdminEventDetailScreen> createState() => _AdminEventDetailScreenState();
}

class _AdminEventDetailScreenState extends State<AdminEventDetailScreen> {
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

  void _toggleEdit(Event event) {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _titleController.text = event.title ?? "";
        _descController.text = event.description ?? "";
        _typeController.text = event.eventType ?? "";
        _startDateController.text = event.startDate ?? "";
        _endDateController.text = event.endDate ?? "";
      }
    });
  }

  void _saveChanges() {
    final data = {
      "title": _titleController.text,
      "description": _descController.text,
      "eventType": _typeController.text,
      "startDate": _startDateController.text,
      "endDate": _endDateController.text,
    };
    context.read<EventCubit>().updateEvent(widget.eventId, data);
    setState(() => _isEditing = false);
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
          actions: [
            BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                return state.maybeWhen(
                  detail: (event) => IconButton(
                    icon: Icon(_isEditing ? Icons.save : Icons.edit),
                    onPressed: () {
                      if (_isEditing) {
                        _saveChanges();
                      } else {
                        _toggleEdit(event);
                      }
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context.read<EventCubit>().deleteEvent(widget.eventId);
              },
            ),
          ],
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
