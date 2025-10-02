// lib/screens/admin/admin_users_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/user/user_cubit.dart';
import '../../cubits/user/user_state.dart';
import '../../models/user.dart';
import '../../app/routes.dart';
import '../../utils/constants.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedRole = 'All Roles';

  final List<String> _roles = [
    'All Roles',
    'Student',
    'Faculty',
    'Admin',
  ];

  @override
  void initState() {
    super.initState();
    // Fetch users on screen load
    context.read<UserCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.primary),
            onPressed: () => _createNewUser(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterSection(),
          _buildAllUsersHeader(),
          Expanded(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text("No users yet")),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (users) {
                    var filtered = _applyFilters(users);

                    if (filtered.isEmpty) {
                      return const Center(child: Text("No users found"));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final user = filtered[index];
                        return _buildUserCard(user, index);
                      },
                    );
                  },
                  error: (msg) => Center(
                    child: Text(msg,
                        style: const TextStyle(color: Colors.red)),
                  ),
                );
              },
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }


  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search users by name, email, ID',
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.border),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildFilterDropdown(
              value: _selectedRole,
              items: _roles,
              hint: 'Role',
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });

                final cubit = context.read<UserCubit>();
                switch (_selectedRole) {
                  case 'Student':
                    cubit.fetchStudents();
                    break;
                  case 'Faculty':
                    cubit.fetchFaculties();
                    break;
                  case 'Admin':
                    cubit.fetchUsers(); // then filter locally
                    break;
                  case 'All Roles':
                    cubit.fetchUsers();
                    break;
                }
              },
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          items: items
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis),
                  ))
              .toList(),
          onChanged: onChanged,
          isExpanded: true,
          hint: Text(hint),
        ),
      ),
    );
  }

  Widget _buildAllUsersHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: const Row(
        children: [
          Text(
            'All Users',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }


  List<User> _applyFilters(List<User> users) {
    var filtered = users;

    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filtered = filtered.where((u) {
        return (u.name ?? '').toLowerCase().contains(query) ||
            (u.email ?? '').toLowerCase().contains(query) ||
            (u.username ?? '').toLowerCase().contains(query);
      }).toList();
    }

    if (_selectedRole == 'Admin') {
      filtered = filtered.where((u) {
        return u.student == null && u.faculty == null;
      }).toList();
    } else if (_selectedRole == 'Student') {
      filtered = filtered.where((u) => u.student != null).toList();
    } else if (_selectedRole == 'Faculty') {
      filtered = filtered.where((u) => u.faculty != null).toList();
    }

    return filtered;
  }

 Widget _buildUserCard(User user, int index) {
  // Determine the role and extra info
  String role = "Admin"; 
  String extraInfo = "";

  if (user.student != null) {
    role = "Student";
    extraInfo = "Level: ${user.student!.level ?? 'N/A'}";
  } else if (user.faculty != null) {
    role = "Faculty";
    extraInfo = "Position: ${user.faculty?['position'] ?? 'N/A'}";
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFE3F2FD),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Stack(
      children: [
        ListTile(
          title: Text(user.name ?? "No name available"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.email ?? "No email"),
              const SizedBox(height: 4),
              Text("Role: $role"),
              if (extraInfo.isNotEmpty) Text(extraInfo),
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.close,
                      size: 18, color: Colors.white),
                  onPressed: () => _deleteUser(user),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit,
                      size: 18, color: Colors.white),
                 onPressed: () => _editUser(user),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              if (user.id != null) {
                context.read<UserCubit>().deleteUser(user.id!);
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

void _editUser(User user) async {
  final updatedUser = await Navigator.pushNamed(
    context,
    AppRoutes.editUser,
    arguments: {"user": user},
  );

  if (updatedUser != null && mounted) {
    context.read<UserCubit>().fetchUsers(); // refresh list after edit
  }


}

  void _createNewUser() {
    Navigator.pushNamed(context, AppRoutes.createUser);
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
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
      onTap: (index) => _navigateToScreen(index, context),
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
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
