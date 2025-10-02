import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/announcement.dart';
import '../../cubits/announcement/announcement_cubit.dart';
import '../../cubits/announcement/announcement_state.dart';

class StudentAnnouncementDetailScreen extends StatefulWidget {
  final int announcementId;
  const StudentAnnouncementDetailScreen({super.key, required this.announcementId});

  @override
  State<StudentAnnouncementDetailScreen> createState() => _StudentAnnouncementDetailScreenState();
}

class _StudentAnnouncementDetailScreenState extends State<StudentAnnouncementDetailScreen> {
  bool _isEditing = false;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AnnouncementCubit>().fetchAnnouncement(widget.announcementId);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true); // ✅ notify parent to refresh
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Announcement Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: BlocConsumer<AnnouncementCubit, AnnouncementState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (announcement) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Announcement updated")),
                );
              },
              deleted: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Announcement deleted")),
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
              detail: (announcement) => _buildDetailOrEdit(announcement),
              success: (announcement) => _buildDetailOrEdit(announcement),
              error: (msg) => Center(child: Text(msg)),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailOrEdit(Announcement announcement) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isEditing
              ? TextField(controller: _titleController, decoration: const InputDecoration(labelText: "Title"))
              : Text(announcement.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _isEditing
              ? TextField(controller: _contentController, decoration: const InputDecoration(labelText: "Content"), maxLines: 5)
              : Text(announcement.content),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
