import 'package:dio/dio.dart';
import 'package:sj_secretary_app/core/Models/wikis/wiki_list_model.dart';
import 'package:sj_secretary_app/core/Services/dio_service.dart';
import 'package:sj_secretary_app/core/Services/endpoints.dart';
import 'package:sj_secretary_app/locator.dart';

class WikiService {
  DioService dioService = locator<DioService>();

  Future<WikiList> getAllWiki() async {
    Response wikiResponse = await dioService.get().get("$baseUrl/$getWiki");
    print(wikiResponse.data);
    return WikiList.fromJson(wikiResponse.data);
  }

  Future<WikiList> getServiceWiki() async {
    Response wikiResponse = await dioService.get().get("$baseUrl/$serviceWiki");
    print(wikiResponse.data);
    return WikiList.fromJson(wikiResponse.data);
  }

  Future<WikiList> getMembershipWiki() async {
    Response wikiResponse =
        await dioService.get().get("$baseUrl/$membershipWiki");
    print(wikiResponse.data);
    return WikiList.fromJson(wikiResponse.data);
  }

  Future<WikiList> getInsuranceWiki() async {
    Response wikiResponse =
        await dioService.get().get("$baseUrl/$insuranceWiki");
    print(wikiResponse.data);
    return WikiList.fromJson(wikiResponse.data);
  }

  Future<WikiList> getDiscountWiki() async {
    Response wikiResponse =
        await dioService.get().get("$baseUrl/$discountWiki");
    print(wikiResponse.data);
    return WikiList.fromJson(wikiResponse.data);
  }
}
