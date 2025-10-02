import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univa_application/app/routes.dart';
import '../../cubits/support_ticket/support_ticket_cubit.dart';
import '../../cubits/support_ticket/support_ticket_state.dart';
import '../../utils/constants.dart';
import 'student_create_ticket_screen.dart';

class StudentSupportScreen extends StatelessWidget {
  const StudentSupportScreen({super.key});

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 1,
      title: const Text('Support Tickets'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: AppColors.primary),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CreateTicketScreen(),
              ),
            );
            if (result == true) {
              context.read<SupportTicketCubit>().fetchMyTickets();
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fetch tickets when entering screen
    context.read<SupportTicketCubit>().fetchMyTickets();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: BlocBuilder<SupportTicketCubit, SupportTicketState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loadedList: (tickets) => tickets.isEmpty
                ? _buildEmptyState()
                : _buildTicketsList(tickets),
            loadedSingle: (_) => const SizedBox.shrink(),
            success: (_) => const SizedBox.shrink(),
            ticketCreated: (_) => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.support_agent,
              size: 64, color: AppColors.textSecondary.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text('No support tickets yet',
              style: TextStyle(fontSize: 18, color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          Text('Tap the + button to create a new ticket',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildTicketsList(List tickets) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return _buildTicketCard(ticket);
      },
    );
  }

  Widget _buildTicketCard(ticket) {
    Color statusColor;
    Color statusTextColor = Colors.white;
    switch (ticket.status) {
      case 'Open':
        statusColor = const Color(0xFF016A69);
        break;
      case 'In Progress':
        statusColor = const Color(0xFFF0C64B);
        break;
      case 'Resolved':
        statusColor = const Color(0xFF8CC8AF);
        statusTextColor = AppColors.primary;
        break;
      case 'Closed':
        statusColor = const Color(0xFFFF7272);
        break;
      default:
        statusColor = AppColors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ticket.subject,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: statusColor, borderRadius: BorderRadius.circular(16)),
              child: Text(ticket.status ?? 'Open',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: statusTextColor)),
            ),
          ],
        ),
      ),
    );
  }
    Widget _buildBottomNavigationBar(BuildContext context) {
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
        currentIndex: 3,
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
      case 1: // Courses
        Navigator.pushNamed(context, AppRoutes.studentCourses);
        break;
      case 2: // Grades
        Navigator.pushNamed(context, AppRoutes.studentGrades);
        break;
      case 3: // Support
        break;
      case 4: // Profile
        Navigator.pushNamed(context, AppRoutes.studentProfile);
        break;
    }
  }
  
}
