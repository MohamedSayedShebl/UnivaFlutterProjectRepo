// lib/app/routes.dart

class AppRoutes {
  // Student routes
  static const String studentHome = '/student-home';
  static const String studentCourses = '/student-courses';
  static const String studentCourseDetail = '/student-course-detail';
  static const String studentGrades = '/student-grades';
  static const String studentSupport = '/student-support';
  static const String studentProfile = '/student-profile';
  static const String createTicket = '/create-ticket';
  static const String courseEnrollment = '/course-enrollment';
   static const String editProfile = '/edit-profile';

  // Admin routes
  static const String adminHome = '/admin-home';
  static const String adminCourses = '/admin-courses';
  static const String adminGrades = '/admin-grades';
  static const String adminSupport = '/admin-support';
  static const String adminUsers = '/admin-users';
  static const String createAnnouncement = '/create-Announcement';
  static const String createCourse = '/create-Course';
  static const String adminTicketDetails = '/admin-ticket-Details';
  static const String createUser = '/create-User';
  static const String editUser = '/edit-User';
  static const String editCourse = '/edit-Course';
  

  // Shared/Auth routes
  static const String login = '/login';

  // Utility method to get route name from string
  static String getRouteFromString(String routeName) {
    switch (routeName) {
      case 'studentHome':
        return studentHome;
      case 'studentCourses':
        return studentCourses;
      case 'studentGrades':
        return studentGrades;
      case 'studentSupport':
        return studentSupport;
      case 'studentProfile':
        return studentProfile;
      case 'adminHome':
        return adminHome;
      case 'adminCourses':
        return adminCourses;
      case 'adminGrades':
        return adminGrades;
      case 'adminSupport':
        return adminSupport;
      case 'adminUsers':
        return adminUsers;
      case 'login':
        return login;
      case 'editUser':
        return editUser;
      case 'editCourse':
        return editCourse;
      case 'adminTicketDetails':
      return adminTicketDetails;
      default:
        return login;
    }
  }

  // Utility method to check if route is student route
  static bool isStudentRoute(String route) {
    return route.startsWith('/student');
  }

  // Utility method to check if route is admin route
  static bool isAdminRoute(String route) {
    return route.startsWith('/admin');
  }

  // Utility method to get base route without parameters
  static String getBaseRoute(String fullRoute) {
    final uri = Uri.parse(fullRoute);
    return uri.path;
  }
}