// lib/cubits/login/login_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/login_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponse data) = _Success;
  const factory LoginState.failure(String message) = _Failure;
  const factory LoginState.loggedOut() = _LoggedOut;
}
