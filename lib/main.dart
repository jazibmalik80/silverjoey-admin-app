// @dart=2.9

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/homeBottomNavView.dart';
import 'package:sj_secretary_app/Pages/treasurerApp/treasurerBottomNavView.dart';

import 'Pages/secretaryApp/loginPage.dart';
import 'core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'locator.dart';

void main() async {
  locatorsetup();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationViewmodel>(
      create: (context) => AuthenticationViewmodel()..loadEmployeeProfile(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AFMS Admin',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xFF029247),
          accentColor: Color(0xFF029247),
        ),
        home: Consumer<AuthenticationViewmodel>(
          builder: (context, provider, child) {
            if (provider.getGlobalAuthState() == AUTH_STATES.LoggedIn) {
              if (provider.employeeList.data.first.designation == "Treasurer")
                return TreasurerBottomNavView();
              else if (provider.employeeList.data.first.designation ==
                  "Secretary")
                return HomeBottomNavView();
              else
                return LoginPage();
            } else if (provider.getGlobalAuthState() == AUTH_STATES.LoggedOut)
              return LoginPage();
            else
              return LoggingInPage();
          },
        ),
      ),
    );
  }
}

class LoggingInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image(
              image: AssetImage(
                "assets/AFMS_Logo.png",
              ),
              width: 280,
              height: 210,
            ),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
