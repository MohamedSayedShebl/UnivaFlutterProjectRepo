import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_user_state.dart';
import '../../repositories/admin_user_repository.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final AdminUserRepository _repo;

  CreateUserCubit(this._repo) : super(const CreateUserState.initial());

    Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String role,

    String? dateOfBirth,
    
    //faculty-specific
    String? position,
    String? department,

    // Student-specific
    String? level,    
    String? phone,
    String? address,
    String? gpa,
    String? totalCredits,
  }) async {
    emit(const CreateUserState.loading());

    final result = await _repo.createUser(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      role: role,
      phone: phone,
      dateOfBirth: dateOfBirth,
      position: position,
      department: department,
      // Student-specific
      level: level,
      address: address,
      gpa: gpa,
      totalCredits: totalCredits,
    );

    result.when(
      success: (user) => emit(CreateUserState.success(user)),
      failure: (error) => emit(CreateUserState.failure(error)),
    );
  }
}