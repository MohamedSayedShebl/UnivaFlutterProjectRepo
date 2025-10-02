// lib/core/network/api_services.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/announcement.dart';
import '../../models/course.dart';
import '../../models/course_section.dart';
import '../../models/enrollment.dart';
import '../../models/event.dart';
import '../../models/login_response.dart';
import '../../models/logout_response.dart';
import '../../models/support_ticket.dart';
import '../../models/user.dart';
import '../storage/token_storage.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8000/api")
abstract class ApiServices {
  factory ApiServices(Dio dio, {required String baseUrl}){

   dio.options.baseUrl = baseUrl;


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiServices(dio, baseUrl: baseUrl);
  }

  @POST("/login")
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST("/users")
  Future<User> createUser(@Body() Map<String, dynamic> body);
  
  @GET("/users/{id}")
  Future<HttpResponse<dynamic>> getUser(@Path("id") int id);

  @GET("/users")
  Future<HttpResponse<dynamic>> getUsersRaw();

  @GET("/users/students")
  Future<HttpResponse<dynamic>> getStudentsRaw();

  @GET("/users/faculties")
  Future<HttpResponse<dynamic>> getFacultiesRaw();

  @POST("/edit-user/{id}")
  Future<User> editUser(@Path("id") int id, @Body() Map<String, dynamic> body);

  @POST("/delete-user/{id}")
  Future<void> deleteUser(@Path("id") int id);

  @POST('/announcement/create')
  Future<Announcement> createAnnouncement(@Body() Map<String, dynamic> body);
  
  @GET("/announcement/{id}")
  Future<HttpResponse<dynamic>> getAnnouncement(@Path("id") int id);

  @PUT("/announcement/update/{id}")
  Future<HttpResponse<dynamic>> updateAnnouncement(@Path("id") int id, @Body() Map<String, dynamic> body,);

  @DELETE("/announcement/delete/{id}")
  Future<HttpResponse<dynamic>> deleteAnnouncement(@Path("id") int id);

  @GET("/announcement")
  Future<List<Announcement>> getAnnouncements();
   
  @GET("/event")
  Future<List<Event>> getEvents();

  @POST('/event-create')
  Future<Event> createEvent(@Body() Map<String, dynamic> body);

  @GET("/event/{id}")
  Future<Event> getEvent(@Path("id") int id);

  @PUT("/event/{id}")
  Future<Event> updateEvent(@Path("id") int id, @Body() Map<String, dynamic> body);

  @DELETE("/event/{id}")
  Future<void> deleteEvent(@Path("id") int id);

  @GET("/courses")
  Future<HttpResponse<dynamic>> getCoursesRaw();

  @GET("/courses/{id}")
  Future<HttpResponse<dynamic>> getCourseRaw(@Path("id") int id);

  @POST("/course-create")
  Future<Course> createCourse(@Body() Map<String, dynamic> body);

  @POST("/course-update/{id}")
  Future<Course> updateCourse(@Path("id") int id, @Body() Map<String, dynamic> body);

  @POST("/course-delete/{id}")
  Future<void> deleteCourse(@Path("id") int id);

  @GET('/course-sections')
  Future<List<CourseSection>> getAllCourseSections();

  @GET('/course-section/{id}')
  Future<CourseSection> getCourseSectionById(@Path() int id);

  @POST('/course-section-update/{id}')
  Future<CourseSection> updateCourseSection(
      @Path() int id,
      @Body() Map<String, dynamic> body,
  );

  @POST('/course-section-delete/{id}')
  Future<void> deleteCourseSection(@Path() int id);

  @GET('/course-sections-current')
  Future<List<CourseSection>> getCurrentCourseSections();

 @GET('/course/enrollments')
 Future<HttpResponse<dynamic>> getAvailableEnrollmentsRaw();


  @POST('/course/enrollments')
 Future<HttpResponse<dynamic>> createEnrollmentsRaw(@Body() Map<String, dynamic> body);

  @PUT('/course/enrollments')
  Future<List<Enrollment>> updateEnrollments(@Body() Map<String, dynamic> body);

  @GET('/course/all-enrollments/{studentId}')
  Future<HttpResponse<dynamic>> getAllEnrollmentsRaw(@Path() int studentId);

  @GET('/course/current-enrollments/{studentId}')
  Future<List<Enrollment>> getCurrentEnrollments(@Path() int studentId);

  @GET("/support-tickets")
  Future<List<SupportTicket>> getSupportTickets();

  @GET("/support-tickets/{id}")
  Future<SupportTicket> getSupportTicket(@Path("id") int id);

  @PUT("/support-tickets/{id}")
  Future<SupportTicket> updateSupportTicket(
    @Path("id") int id,
    @Body() Map<String, dynamic> body,
  );

   @GET("/my-support-tickets")
  Future<List<SupportTicket>> getMySupportTickets();

   @POST("/support-tickets")
  Future<SupportTicket> createSupportTicket(@Body() Map<String, dynamic> body);

   @POST("/edit-profile/{id}")
   Future<HttpResponse<dynamic>> updateStudentProfile(
   @Path("id") int id, @Body() Map<String, dynamic> body);

   @POST("/logout/{id}")
   Future<LogoutResponse> logout(@Path("id") int id);
}
