import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user.dart';

part 'create_user_state.freezed.dart';

@freezed
class CreateUserState with _$CreateUserState {
  const factory CreateUserState.initial() = _Initial;
  const factory CreateUserState.loading() = _Loading;
  const factory CreateUserState.success(User user) = _Success;
  const factory CreateUserState.failure(String message) = _Failure;
}
