// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univa_application/cubits/course_section/course_section_cubit.dart';
import 'package:univa_application/cubits/enrollment/enrollment_cubit.dart';
import 'package:univa_application/cubits/support_ticket/support_ticket_cubit.dart';
import 'package:univa_application/repositories/announcement_repository.dart';
import 'package:univa_application/repositories/course_section_repository.dart';
import 'package:univa_application/repositories/enrollment_repository.dart';
import 'package:univa_application/repositories/event_repository.dart';
import 'package:univa_application/repositories/support_ticket_repository.dart';
import 'package:univa_application/screens/admin/admin_course_detail_screen.dart';
import 'app/routes.dart';
import 'core/network/service_locator.dart';
import 'cubits/announcement/announcement_cubit.dart';
import 'cubits/course/course_cubit.dart';
import 'cubits/create_user/create_user_cubit.dart';
import 'cubits/event/event_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/profile/profile_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'models/course.dart';
import 'repositories/admin_user_repository.dart';
import 'repositories/auth_repository.dart';
import 'models/user.dart';
import 'repositories/course_repository.dart';
import 'repositories/profile_repository.dart';
import 'screens/login_screen.dart';
import 'screens/student/student_home_screen.dart';
import 'screens/student/student_courses_screen.dart';
import 'screens/student/student_course_detail_screen.dart';
import 'screens/student/student_profile_screen.dart';
import 'screens/student/student_support_screen.dart';
import 'screens/student/student_grades_screen.dart';
import 'screens/student/student_create_ticket_screen.dart';
import 'screens/student/student_course_enrollment_screen.dart';
import 'screens/admin/admin_home_screen.dart';
import 'screens/admin/admin_courses_screen.dart';
import 'screens/admin/admin_create_announcement_screen.dart';
import 'screens/admin/admin_create_course_screen.dart';
import 'screens/admin/admin_grades_screen.dart';
import 'screens/admin/admin_users_screen.dart';
import 'screens/admin/admin_support_screen.dart';
import 'screens/admin/admin_create_user_screen.dart';
import 'screens/admin/admin_edit_user_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AdminUserRepository>(
          create: (_) => locator<AdminUserRepository>(),
        ),
        RepositoryProvider<AuthRepo>(
          create: (_) => locator<AuthRepo>(),
        ),
        RepositoryProvider<EventRepository>(
          create: (_) => locator<EventRepository>(),
        ),
        RepositoryProvider<AnnouncementRepository>(
          create: (_) => locator<AnnouncementRepository>(),
        ),
        RepositoryProvider<CourseRepo>(
          create: (_) => locator<CourseRepo>(),
        ),
        RepositoryProvider<SupportTicketRepository>(
          create: (_) => locator<SupportTicketRepository>(),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (_) => locator<ProfileRepository>(),
        ),
        RepositoryProvider<CourseSectionRepository>(
          create: (_) => locator<CourseSectionRepository>(),
        ),
        RepositoryProvider<EnrollmentRepository>(
          create: (_) => locator<EnrollmentRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (context) => UserCubit(context.read<AdminUserRepository>()),
          ),
          BlocProvider<CreateUserCubit>(
            create: (context) => CreateUserCubit(context.read<AdminUserRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(context.read<AuthRepo>()),
          ),
          BlocProvider<EventCubit>(
            create: (context) => EventCubit(context.read<EventRepository>()),
          ),
          BlocProvider<AnnouncementCubit>(
            create: (context) => AnnouncementCubit(context.read<AnnouncementRepository>()),
          ),
          BlocProvider<CourseCubit>(
            create: (context) => CourseCubit(context.read<CourseRepo>()),
          ),
          BlocProvider<SupportTicketCubit>(
            create: (context) => SupportTicketCubit(context.read<SupportTicketRepository>()),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(context.read<ProfileRepository>()),
          ),
          BlocProvider<CourseSectionCubit>(
            create: (context) => CourseSectionCubit(context.read<CourseSectionRepository>()),
          ),
          BlocProvider<EnrollmentCubit>(
            create: (context) => EnrollmentCubit(context.read<EnrollmentRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univa',
      theme: ThemeData(
        primaryColor: const Color(0xFF016A69),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const LoginScreen(),
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.studentHome: (context) => const StudentHomeScreen(),
        AppRoutes.studentCourses: (context) => const StudentCoursesScreen(),
        AppRoutes.studentCourseDetail: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          final course = args['course'] as Course; // cast to Course
          return StudentCourseDetailScreen(course: course);
        },
        AppRoutes.studentProfile: (context) => const StudentProfileScreen(),
        AppRoutes.studentSupport: (context) => const StudentSupportScreen(),
        AppRoutes.studentGrades: (context) => const StudentGradesScreen(),
        AppRoutes.createTicket: (context) => const CreateTicketScreen(),
        AppRoutes.courseEnrollment: (context) => const CourseEnrollmentScreen(),
        AppRoutes.adminHome: (context) => const AdminHomeScreen(),
        AppRoutes.createAnnouncement: (context) => const CreateAnnouncementScreen(),
        AppRoutes.adminCourses: (context) => const AdminCoursesScreen(),
        AppRoutes.createCourse: (context) => const CreateCourseScreen(),
        AppRoutes.createUser: (context) => const AdminCreateUserScreen(),
        AppRoutes.adminGrades: (context) => const AdminGradesScreen(),
        AppRoutes.editUser: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          final user = args['user'] as User; // ✅ cast it back to User
          return AdminEditUserScreen(user: user);
        },
        AppRoutes.editCourse: (context) {
         final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
         final courseId = args['courseId'] as int;
         return CourseDetailScreen(courseId: courseId);
        },
        AppRoutes.adminUsers: (context) => const AdminUsersScreen(),
        AppRoutes.adminSupport: (context) => const AdminSupportScreen(),

       
      },
    );
  }
}