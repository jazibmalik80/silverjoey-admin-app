import 'package:get_it/get_it.dart';
import 'package:sj_secretary_app/core/Services/calculator_service.dart';
import 'package:sj_secretary_app/core/Services/dio_service.dart';
import 'package:sj_secretary_app/core/Services/meeting_service.dart';
import 'package:sj_secretary_app/core/Services/notification_service.dart';
import 'package:sj_secretary_app/core/Services/support_service.dart';
import 'package:sj_secretary_app/core/Services/task_service.dart';
import 'package:sj_secretary_app/core/Services/wiki_service.dart';

import 'core/Services/authentication_service.dart';
import 'core/Services/equity_service.dart';
import 'core/Services/profile_service.dart';
import 'core/Services/transaction_service.dart';

final locator = GetIt.instance;

void locatorsetup() {
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton<CalculatorService>(() => CalculatorService());
  locator.registerLazySingleton<ContactSupportService>(
      () => ContactSupportService());
  locator.registerLazySingleton<EquityService>(() => EquityService());
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
  locator.registerLazySingleton<ProfileService>(() => ProfileService());
  locator.registerLazySingleton<TransactionService>(() => TransactionService());
  locator.registerLazySingleton<WikiService>(() => WikiService());
  locator.registerLazySingleton<MeetingService>(() => MeetingService());
  locator.registerLazySingleton<TaskService>(() => TaskService());
}
