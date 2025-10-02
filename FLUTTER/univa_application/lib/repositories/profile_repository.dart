import '../core/network/api_services.dart';
import '../core/network/api_result.dart';
import '../models/student.dart';
import '../models/user.dart';

class ProfileRepository {
  final ApiServices _api;

  ProfileRepository(this._api);

  Future<ApiResult<User>> fetchProfile(int userId) async {
    try {
      final response = await _api.getUser(userId);
      

      print('Raw user response: $response');
      print('Raw user response type: ${response.runtimeType}');
      print('Raw user response.data: ${response.data}');
      print('Raw user response.data type: ${response.data.runtimeType}');
      

      final user = _mapApiResponseToUser(response.data);
      

      print('Mapped user: $user');
      print('Mapped user student: ${user.student}');
      
      return ApiResult.success(user);
    } catch (e) {
      print('Error in fetchProfile: $e');
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<User>> updateProfile(int userId, Map<String, dynamic> data) async {
    try {
      final response = await _api.updateStudentProfile(userId, data);
      

      print('Raw update response: $response');
      print('Raw update response.data: ${response.data}');
      

      final user = _mapApiResponseToUser(response.data);
      
      return ApiResult.success(user);
    } catch (e) {
      print('Error in updateProfile: $e');
      return ApiResult.failure(e.toString());
    }
  }

  User _mapApiResponseToUser(dynamic responseData) {

    print('_mapApiResponseToUser received: $responseData');
    print('_mapApiResponseToUser received type: ${responseData.runtimeType}');
    

    Map<String, dynamic> userJson;
    
    if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
      userJson = responseData['data'] as Map<String, dynamic>;
    } else if (responseData is Map<String, dynamic>) {
      userJson = responseData;
    } else {
      throw Exception('Unexpected response format: ${responseData.runtimeType}');
    }

    print('Extracted user JSON: $userJson');
    print('Student data in JSON: ${userJson['student']}');
    

    final studentJson = userJson['student'] as Map<String, dynamic>?;
    
    return User(
      id: userJson['id'] as int?,
      name: userJson['name'] as String?,
      username: userJson['username'] as String?,
      email: userJson['email'] as String?,
      student: studentJson != null 
          ? Student(
              studentId: studentJson['student_id'] as int?,
              userId: studentJson['user_id'] as int?,
              phone: studentJson['phone'] as String?,
              address: studentJson['address'] as String?,
              currentGpa: _parseGpa(studentJson['current_gpa']),
              totalCredits: studentJson['total_credits'] as int?,
              level: studentJson['level'] as String?,
            )
          : null,
      faculty: userJson['faculty'] as Map<String, dynamic>?,
    );
  }

  double? _parseGpa(dynamic gpa) {
    if (gpa == null) return null;
    if (gpa is double) return gpa;
    if (gpa is int) return gpa.toDouble();
    if (gpa is String) return double.tryParse(gpa);
    return null;
  }
}