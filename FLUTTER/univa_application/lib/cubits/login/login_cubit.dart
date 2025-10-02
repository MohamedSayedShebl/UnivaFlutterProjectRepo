// lib/cubits/login/login_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univa_application/models/login_response.dart';
import 'package:univa_application/models/logout_response.dart';
import 'package:univa_application/repositories/auth_repository.dart';
import '../../core/storage/token_storage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  String? _studentId; // store the real student_id (from username)
  int? _userId; // ✅ store the user ID

  LoginCubit(this._authRepo) : super(const LoginState.initial());

  String? get studentId => _studentId; // ✅ getter for studentId
  int? get userId => _userId; // ✅ getter for user ID

  Future<void> login(String username, String password) async {
    emit(const LoginState.loading());

    final result = await _authRepo.login(username, password);

    result.when(
      success: (LoginResponse data) async {
        _studentId = data.user.username; // username is the student_id
        _userId = data.user.id; // ✅ store the user ID
        emit(LoginState.success(data));
        await TokenStorage.saveToken(data.token);
      },
      failure: (String message) => emit(LoginState.failure(message)),
    );
  }

  Future<void> logout() async {
    emit(const LoginState.loading());
    final result = await _authRepo.logout(int.tryParse(_studentId ?? "0") ?? 0);
    result.when(
      success: (LogoutResponse data) async {
        emit(const LoginState.loggedOut());
        _studentId = null;
        _userId = null; // ✅ clear user ID
        await TokenStorage.clearToken();
      },
      failure: (String message) {
        emit(LoginState.failure("Logout failed: $message"));
      },
    );
  }
}