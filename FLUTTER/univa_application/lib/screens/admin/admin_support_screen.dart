import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univa_application/screens/admin/admin_ticket_details_screen.dart';
import '../../cubits/support_ticket/support_ticket_cubit.dart';
import '../../cubits/support_ticket/support_ticket_state.dart';
import '../../models/support_ticket.dart';
import '../../utils/constants.dart';
import '../../app/routes.dart';

class AdminSupportScreen extends StatefulWidget {
  const AdminSupportScreen({super.key});

  @override
  State<AdminSupportScreen> createState() => _AdminSupportScreenState();
}

class _AdminSupportScreenState extends State<AdminSupportScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = "";

  @override
  void initState() {
    super.initState();
    context.read<SupportTicketCubit>().fetchTickets();

    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Tickets'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 1,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: BlocBuilder<SupportTicketCubit, SupportTicketState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loadedList: (tickets) => _buildTicketsList(tickets),
                  ticketCreated: (_) => const SizedBox.shrink(),
                  loadedSingle: (_) => const SizedBox.shrink(),
                  success: (_) => const SizedBox.shrink(),
                  error: (msg) => Center(child: Text("Error: $msg")),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search tickets by title, status, or student',
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.border),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildTicketsList(List<SupportTicket> tickets) {
    final filtered = tickets.where((t) {
      final map = _ticketToMap(t);
      final title =
          (map['subject'] ?? map['title'] ?? '').toString().toLowerCase();
      final status = (map['status'] ?? '').toString().toLowerCase();
      final student =
          (map['student_name'] ?? map['studentName'] ?? '').toString().toLowerCase();
      return title.contains(_query) ||
          status.contains(_query) ||
          student.contains(_query);
    }).toList();

    if (filtered.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<SupportTicketCubit>().fetchTickets();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 60),
            Center(
              child: Text('No support tickets found',
                  style: TextStyle(color: AppColors.textSecondary)),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<SupportTicketCubit>().fetchTickets();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final ticket = filtered[index];
          final map = _ticketToMap(ticket);
          return _buildTicketCard(ticket, map, index == filtered.length - 1);
        },
      ),
    );
  }

  Widget _buildTicketCard(
      SupportTicket ticket, Map<String, dynamic> map, bool isLast) {
    final status = (map['status'] ?? 'Open').toString();
    final subject = (map['subject'] ?? map['title'] ?? 'No subject').toString();
    final date = (map['created_at'] ?? map['createdAt'] ?? '').toString();

    final statusColor = _getStatusColor(status);
    final statusTextColor = _getStatusTextColor(status);

        return GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<SupportTicketCubit>(),
                child: AdminTicketDetailsScreen(ticketId: ticket.ticketId),
              ),
            ),
          );

                      // Always re-fetch if detail screen was closed
          if (result == true) {
            context.read<SupportTicketCubit>().fetchTickets();
          }
        },
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 2))
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(subject,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(date, style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(status,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: statusTextColor)),
              ),
            ],
          ),
        ),
      ),
    );
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
      case 'in progress':
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

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Grades'),
        BottomNavigationBarItem(
            icon: Icon(Icons.support_agent), label: 'Support'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.adminHome);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.adminUsers);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.adminCourses);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.adminGrades);
            break;
          case 4:
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
