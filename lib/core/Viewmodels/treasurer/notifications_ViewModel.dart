import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/notifications/notification_model.dart';
import 'package:sj_secretary_app/core/Services/notification_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/locator.dart';

class NotificationViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.Idle;
  NotificationList? notificationList;
  NotificationService notificationService = locator<NotificationService>();

  Future fetchNotificationsforAdmin(String loggedInUserEmail) async {
    viewState = ViewState.Busy;
    notifyListeners();
    notificationList =
        await notificationService.getNotificationsforAdmin(loggedInUserEmail);
    viewState = ViewState.Idle;
    notifyListeners();
  }
}
