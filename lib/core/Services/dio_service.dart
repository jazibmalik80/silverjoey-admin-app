import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cookie_jar/cookie_jar.dart';

class DioService {
  Dio _dio = new Dio();
  Dio get() => _dio;
  CookieJar cookieJar = CookieJar();

  void setCookieInterceptorForDio() {
    _dio.interceptors.add(CookieManager(cookieJar));
  }

  void storeCookiesForFutureUse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> cookieStrings = [];
    List<Cookie> cookies =
        await cookieJar.loadForRequest(Uri.parse("https://beta.afms.com.ph/"));
    cookies.forEach((e) {
      SerializableCookie serializableCookie = SerializableCookie(e);
      cookieStrings.add(serializableCookie.toJson());
    });
    sharedPreferences.setStringList("auth", cookieStrings);
  }

  void loadSavedCookies() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> cookieStrings = sharedPreferences.getStringList("auth") ?? [];
    List<Cookie> cookies = [];
    if (cookieStrings.isNotEmpty) {
      cookieStrings.forEach((element) {
        SerializableCookie serializableCookie =
            SerializableCookie.fromJson(element);
        cookies.add(serializableCookie.cookie);
      });
      cookieJar.saveFromResponse(
          Uri.parse("https://beta.afms.com.ph/"), cookies);
    } else {
      // Throw an error or something!
      // This is essentially the case that user should login again!
    }
  }
}
