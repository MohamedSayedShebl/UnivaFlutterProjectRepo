// lib/core/network/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:univa_application/repositories/announcement_repository.dart';
import 'package:univa_application/repositories/course_section_repository.dart';
import 'package:univa_application/repositories/enrollment_repository.dart';
import 'package:univa_application/repositories/profile_repository.dart';
import 'package:univa_application/repositories/support_ticket_repository.dart';
import '../../repositories/course_repository.dart';
import '../../repositories/event_repository.dart';
import 'api_services.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/admin_user_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register secure storage
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // Configure Dio
  final dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:8000/api", // 👈 emulator base URL
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      "Accept": "application/json",
    },
  ));

  // Add logging (for debugging)
  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
  ));

  // Auth interceptor (adds Bearer token automatically)
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final storage = locator<FlutterSecureStorage>();
      final token = await storage.read(key: 'auth_token');
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        options.headers.remove('Authorization');
      }
      return handler.next(options);
    },
  ));

  // Register Dio
  locator.registerLazySingleton<Dio>(() => dio);

  // ✅ Register Retrofit ApiServices
  locator.registerLazySingleton<ApiServices>(
    () => ApiServices(locator<Dio>(), baseUrl: "http://10.0.2.2:8000/api"),
  );

  // Register repositories
  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepo(locator<ApiServices>()),
  );
  locator.registerLazySingleton<AdminUserRepository>(
    () => AdminUserRepository(locator<ApiServices>()),
  );

  locator.registerLazySingleton<AnnouncementRepository>(
    () => AnnouncementRepository(locator<ApiServices>()),
  );

  locator.registerLazySingleton<EventRepository>(
    () => EventRepository(locator<ApiServices>())
    );

  locator.registerLazySingleton<CourseRepo>(
    () => CourseRepo(locator<ApiServices>())
    );

  locator.registerLazySingleton<SupportTicketRepository>(
    () => SupportTicketRepository(locator<ApiServices>())
    );

  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(locator<ApiServices>())
    );

  locator.registerLazySingleton<EnrollmentRepository>(
    () => EnrollmentRepository(locator<ApiServices>())
    );

  locator.registerLazySingleton<CourseSectionRepository>(
    () => CourseSectionRepository(locator<ApiServices>())
    );
}
