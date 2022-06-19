import 'package:dio/dio.dart';

import 'package:sj_secretary_app/core/Models/services/service_model.dart';
import 'package:sj_secretary_app/core/Services/endpoints.dart';

import '../../locator.dart';
import 'dio_service.dart';

class CalculatorService {
  DioService dioService = locator<DioService>();

  Future<ServiceList> getOfferedServices() async {
    Response serviceResponse =
        await dioService.get().get("$baseUrl/$getOfferedServicesurl");
    return ServiceList.fromJson(serviceResponse.data);
  }
}
