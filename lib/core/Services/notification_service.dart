import 'package:dio/dio.dart';
import 'package:sj_secretary_app/core/Models/notifications/notification_model.dart';
import 'package:sj_secretary_app/core/Services/dio_service.dart';
import 'package:sj_secretary_app/core/Services/endpoints.dart';
import 'package:sj_secretary_app/locator.dart';

class NotificationService {
  DioService dioService = locator<DioService>();

  Future<NotificationList> getNotificationsforAdmin(
      String loggedInUserEmail) async {
    Response notificationsResponse = await dioService.get().get(
        '''$baseUrl/$GET_notifications&filters=[["for_user","=","$loggedInUserEmail"]]''');
    print(notificationsResponse.statusCode);
    return NotificationList.fromJson(notificationsResponse.data);
  }
}
