import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user.dart';
import '../../repositories/admin_user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AdminUserRepository _repo;
  User? currentUser;

  UserCubit(this._repo) : super(const UserState.initial());

  Future<void> fetchUsers() async {
    emit(const UserState.loading());
    final result = await _repo.getUsers();
    result.when(
      success: (users) => emit(UserState.loaded(users)),
      failure: (msg) => emit(UserState.error(msg)),
    );
  }


  Future<void> fetchStudents() async {
    emit(const UserState.loading());
    final result = await _repo.getStudents();
    result.when(
      success: (users) => emit(UserState.loaded(users)),
      failure: (msg) => emit(UserState.error(msg)),
    );
  }

  Future<void> fetchFaculties() async {
    emit(const UserState.loading());
    final result = await _repo.getFaculties();
    result.when(
      success: (users) => emit(UserState.loaded(users)),
      failure: (msg) => emit(UserState.error(msg)),
    );
  }

  Future<void> deleteUser(int id) async {
  emit(const UserState.loading());
  final result = await _repo.deleteUser(id);
  result.when(
    success: (_) async {
      // refetch list after deletion
      final refreshed = await _repo.getUsers();
      refreshed.when(
        success: (users) => emit(UserState.loaded(users)),
        failure: (msg) => emit(UserState.error(msg)),
      );
    },
    failure: (msg) => emit(UserState.error(msg)),
  );
}

Future<void> editUser(int id, Map<String, dynamic> data) async {
  emit(const UserState.loading());
  final result = await _repo.editUser(id, data);

  result.when(
    success: (_) async {
      // Refresh user list after update
      await fetchUsers();
    },
    failure: (error) {
      emit(UserState.error(error));
    },
  );
}

}
