// screens/admin/admin_home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univa_application/cubits/event/event_cubit.dart';
import 'package:univa_application/cubits/event/event_state.dart';
import 'package:univa_application/cubits/announcement/announcement_cubit.dart';
import '../../app/routes.dart';
import '../../cubits/announcement/announcement_state.dart';
import '../../cubits/login/login_cubit.dart';
import '../../repositories/auth_repository.dart';
import '../../utils/constants.dart';
import '../../core/network/service_locator.dart';
import 'admin_announcement_details.dart';
import 'admin_event_detail_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilterIndex = 0;
  String _searchQuery = "";
  final List<String> _filters = ['Announcements', 'Events'];

  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().fetchEvents();
    context.read<AnnouncementCubit>().fetchAnnouncements();

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildCustomAppBar(),
      body: _buildBodyContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    return AppBar(
      backgroundColor: AppColors.card,
      foregroundColor: AppColors.textPrimary,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildLogo(),
      ),
      title: const Text('Admin Dashboard'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: AppColors.primary),
          onPressed: _createNewAnnouncement,
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.red),
          onPressed: _handleLogout,
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/univa_logo.png',
      height: 80,
      width: 80,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text('Logo',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }

  Future<void> _handleLogout() async {
    try {
      final loginCubit = context.read<LoginCubit>();
      final userId = loginCubit.state.maybeWhen(
        success: (loginResponse) => loginResponse.user.id,
        orElse: () => null,
      );

      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No logged-in user found")),
        );
        return;
      }

      final authRepo = locator<AuthRepo>();
      final result = await authRepo.logout(userId);

      result.when(
        success: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data.message)),
          );
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Logout failed: $error")),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout exception: $e")),
      );
    }
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDashboardStats(),
          const SizedBox(height: 24),
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildFilterSection(),
          const SizedBox(height: 24),
          _buildAnnouncementsOrEvents(),
          const SizedBox(height: 24),
          _buildQuickLinks(),
        ],
      ),
    );
  }

  Widget _buildDashboardStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard('Total Students', '1,250'),
              _buildStatCard('Faculty', '120'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard('Courses', '85'),
              _buildStatCard('Pending Tickets', '15'),
            ],
          ),
          const SizedBox(height: 16),
          _buildEnrollmentTrends(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary)),
          ],
        ),
      ),
    );
  }

  Widget _buildEnrollmentTrends() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enrollment Trends',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text('+15%',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Last 12 Months',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
              SizedBox(height: 4),
              Text('+18%',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.searchBackground,
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: ChoiceChip(
            label: Text(_filters[index]),
            selected: _selectedFilterIndex == index,
            selectedColor: AppColors.primary,
            onSelected: (selected) =>
                setState(() => _selectedFilterIndex = index),
            labelStyle: TextStyle(
              color: _selectedFilterIndex == index
                  ? Colors.white
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

Widget _buildAnnouncementsOrEvents() {
  if (_selectedFilterIndex == 0) {
    return BlocBuilder<AnnouncementCubit, AnnouncementState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (announcements) {
            final filtered = announcements
                .where((a) => a.title.toLowerCase().contains(_searchQuery))
                .toList();

            if (filtered.isEmpty) {
              return const Text("No announcements found");
            }

            return Column(
              children: filtered
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildAnnouncementCard(
                        title: entry.value.title,
                        type: "Announcement",
                        description: entry.value.content,
                        index: entry.key,
                        announcementId: entry.value.announcement_id ?? 0,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
          success: (_) => const SizedBox.shrink(),
          detail: (_) => const SizedBox.shrink(),
          deleted: () => const SizedBox.shrink(),
          error: (msg) => Text("Error loading announcements: $msg"),
        );
      },
    );
  } else {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (events) {
            final filtered = events
                .where((e) =>
                    (e.title ?? "").toLowerCase().contains(_searchQuery))
                .toList();

            if (filtered.isEmpty) return const Text('No events found');

            return SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filtered.length,
                itemBuilder: (ctx, index) {
                  final event = filtered[index];
                  final colors = _getEventColors(index);

                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<EventCubit>(),
                            child: AdminEventDetailScreen(eventId: event.eventId!),
                          ),
                        ),
                      );

                      //Always re-fetch if detail screen was closed
                      if (result == true) {
                        context.read<EventCubit>().fetchEvents();
                      }
                    },
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors['backgroundColor'],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colors['backgroundColor'] == Colors.white
                              ? AppColors.border
                              : Colors.transparent,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colors['iconBackgroundColor'],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.event,
                                size: 20, color: colors['iconColor']),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  event.title ?? 'No title',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: colors['textColor'],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  event.startDate ?? 'Unknown date',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: colors['backgroundColor'] ==
                                            AppColors.primary
                                        ? Colors.white.withOpacity(0.8)
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          detail: (_) => const SizedBox.shrink(),
          success: (_) => const SizedBox.shrink(),
          deleted: () => const SizedBox.shrink(),
          error: (message) => Text('Error loading events: $message'),
        );
      },
    );
  }
}


Widget _buildAnnouncementCard({
  required String title,
  required String type,
  required String description,
  required int index,
  required int announcementId,
}) {
  final bgColor = index % 2 == 0
      ? const Color(0xFFFFF8E1)
      : const Color(0xFFE8F5E9);

  return GestureDetector(
    onTap: () async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: context.read<AnnouncementCubit>(),
            child: AnnouncementDetailScreen(announcementId: announcementId),
          ),
        ),
      );

      if (result == true) {
        context.read<AnnouncementCubit>().fetchAnnouncements();
      }
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(type,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary)),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  Map<String, Color> _getEventColors(int index) {
    final isEven = index % 2 == 0;
    return {
      'backgroundColor': isEven ? AppColors.primary : Colors.white,
      'textColor': isEven ? Colors.white : AppColors.primary,
      'iconBackgroundColor': isEven
          ? Colors.white.withOpacity(0.2)
          : AppColors.primary.withOpacity(0.1),
      'iconColor': isEven ? Colors.white : AppColors.primary,
    };
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Links',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        _buildQuickLinkItem('Academic Calendar', Icons.calendar_today),
        const SizedBox(height: 8),
        _buildQuickLinkItem('Student Handbook', Icons.menu_book),
        const SizedBox(height: 8),
        _buildQuickLinkItem('IT Support', Icons.support_agent),
      ],
    );
  }

  Widget _buildQuickLinkItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () => _navigateToQuickLink(title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(width: 12),
            Text(title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                size: 14, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _createNewAnnouncement() =>
      Navigator.pushNamed(context, AppRoutes.createAnnouncement);

  void _navigateToQuickLink(String title) =>
      print('Navigating to: $title');

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Grades'),
        BottomNavigationBarItem(
            icon: Icon(Icons.support_agent), label: 'Support'),
      ],
      onTap: (index) => _navigateToScreen(index),
    );
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.adminUsers);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.adminCourses);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.adminGrades);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.adminSupport);
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
