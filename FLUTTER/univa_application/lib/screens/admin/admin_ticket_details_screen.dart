import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/support_ticket/support_ticket_cubit.dart';
import '../../cubits/support_ticket/support_ticket_state.dart';
import '../../models/support_ticket.dart';
import '../../utils/constants.dart';

class AdminTicketDetailsScreen extends StatefulWidget {
  final int ticketId;

  const AdminTicketDetailsScreen({
    Key? key,
    required this.ticketId,
  }) : super(key: key);

  @override
  State<AdminTicketDetailsScreen> createState() =>
      _AdminTicketDetailsScreenState();
}

class _AdminTicketDetailsScreenState extends State<AdminTicketDetailsScreen> {
  bool _isEditing = false;
  String? _selectedStatus;
  final List<String> _statusOptions = [
    'Open',
    'In Progress',
    'Resolved',
    'Closed'
  ];

  @override
  void initState() {
    super.initState();
    context.read<SupportTicketCubit>().fetchTicket(widget.ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ticket Details'),
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.textPrimary,
          elevation: 1,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false)),
          actions: [
            BlocBuilder<SupportTicketCubit, SupportTicketState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    if (_isEditing) {
                      _submitUpdate();
                    } else {
                      setState(() => _isEditing = true);
                    }
                  },
                );
              },
            )
          ],
        ),
        body: BlocConsumer<SupportTicketCubit, SupportTicketState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (ticket) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ticket updated')));
                Navigator.pop(context, true);
              },
              error: (msg) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Error: $msg')));
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: CircularProgressIndicator()),
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              loadedList: (_) => const SizedBox.shrink(),
              ticketCreated: (_) => const SizedBox.shrink(),
              loadedSingle: (ticket) => _buildDetailView(ticket),
              success: (ticket) => _buildDetailView(ticket),
              error: (msg) => Center(child: Text('Error: $msg')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailView(SupportTicket ticket) {
    final map = _ticketToMap(ticket);
    final subject = (map['subject'] ?? map['title'] ?? 'Untitled').toString();
    final studentid = (map['student_id']).toString();
    final description = (map['description'] ?? '').toString();
    final createdAt =
        (map['created_at'] ?? map['createdAt'] ?? '').toString();
    final currentStatus = (map['status'] ?? 'Open').toString();

    _selectedStatus ??= currentStatus;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(subject,
            style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Created: $createdAt',
            style: TextStyle(color: AppColors.textSecondary)),
        const SizedBox(height: 16),
        Text('Student ID: $studentid',
            style: TextStyle(color: AppColors.textSecondary)),
        const SizedBox(height: 16),
        Text(description,
            style: const TextStyle(fontSize: 16, height: 1.5)),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 12),
        _isEditing
            ? _buildEditSection()
            : _buildReadOnlyStatus(currentStatus),
        const SizedBox(height: 24),
        if (_isEditing)
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() {
                    _isEditing = false;
                    _selectedStatus = currentStatus;
                  }),
                  style: OutlinedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 16)),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitUpdate,
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 16)),
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
      ]),
    );
  }

  Widget _buildReadOnlyStatus(String status) {
    final color = _getStatusColor(status);
    final textColor = _getStatusTextColor(status);

    return Row(
      children: [
        const Text('Status:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration:
              BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
          child: Text(status,
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: textColor)),
        ),
      ],
    );
  }

  Widget _buildEditSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Update Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedStatus,
              isExpanded: true,
              items: _statusOptions
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (v) => setState(() => _selectedStatus = v),
              hint: const Text('Select status'),
            ),
          ),
        ),
      ],
    );
  }

  void _submitUpdate() {
    if (_selectedStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a status')));
      return;
    }
    context
        .read<SupportTicketCubit>()
        .updateTicket(widget.ticketId, {'status': _selectedStatus});

    
  }

  Map<String, dynamic> _ticketToMap(SupportTicket ticket) {
    try {
      final dyn = ticket as dynamic;
      final map = dyn.toJson?.call();
      if (map is Map<String, dynamic>) return map;
    } catch (_) {}

    final result = <String, dynamic>{};
    try {
      result['ticket_id'] =
          (ticket as dynamic).ticketId ?? (ticket as dynamic).ticket_id;
    } catch (_) {}
    try {
      result['student_id'] =
          (ticket as dynamic).studentId ?? (ticket as dynamic).student_id;
    } catch (_) {}
    try {
      result['subject'] =
          (ticket as dynamic).subject ?? (ticket as dynamic).title;
    } catch (_) {}
    try {
      result['description'] = (ticket as dynamic).description;
    } catch (_) {}
    try {
      result['status'] = (ticket as dynamic).status;
    } catch (_) {}
    try {
      result['created_at'] =
          (ticket as dynamic).createdAt ?? (ticket as dynamic).created_at;
    } catch (_) {}
    return result;
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return const Color(0xFF016A69);
      case 'in_progress':
        return const Color(0xFFF0C64B);
      case 'resolved':
        return const Color(0xFF8CC8AF);
      case 'closed':
        return const Color(0xFFFF7272);
      default:
        return AppColors.primary;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'resolved':
        return AppColors.primary;
      default:
        return Colors.white;
    }
  }
}
