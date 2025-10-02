import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/profile_repository.dart';
import '../../models/user.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repo;
  User? currentUser;

  ProfileCubit(this._repo) : super(const ProfileState.initial());

  Future<void> fetchProfile(int userId) async {
    emit(const ProfileState.loading());
    final result = await _repo.fetchProfile(userId);
    result.when(
      success: (user) {
        currentUser = user;
        emit(ProfileState.loaded(user));
      },
      failure: (msg) => emit(ProfileState.error(msg)),
    );
  }

  Future<void> updateProfile(int userId, Map<String, dynamic> data) async {
    emit(const ProfileState.loading());
    final result = await _repo.updateProfile(userId, data);
    result.when(
      success: (user) {
        currentUser = user;
        emit(ProfileState.loaded(user));
      },
      failure: (msg) => emit(ProfileState.error(msg)),
    );
  }
}