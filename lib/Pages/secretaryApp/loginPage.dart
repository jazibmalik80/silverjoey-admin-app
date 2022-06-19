import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/homeBottomNavView.dart';
import 'package:sj_secretary_app/core/Models/auth/login_credentials.dart';
import 'package:sj_secretary_app/core/Models/auth/login_error.dart';
import 'package:sj_secretary_app/core/Models/auth/login_success.dart';
import 'package:sj_secretary_app/core/Services/authentication_service.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'package:sj_secretary_app/main.dart';
import 'package:sj_secretary_app/utils/utils.dart';

import '../../locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _isLoading = false;

  AuthenticationService authenticationService =
      locator<AuthenticationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image(
                image: AssetImage(
                  "assets/AFMS_Logo.png",
                ),
                width: 160,
                height: 160,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            hintText: "abc@xyz.com",
                            fillColor: Colors.grey[200],
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            fillColor: Colors.grey[200],
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility,
                                color: Colors.grey[600],
                              ),
                              onPressed: toggle,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0),
                        _isLoading
                            ? CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF029247)),
                                      padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                          EdgeInsets.fromLTRB(20, 15, 20, 15)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(23.0),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'SECRETARY\n   SIGN IN',
                                      style: overlayStyle,
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          LoginSuccess loginSuccess =
                                              await authenticationService
                                                  .loginUser(LoginCredentials(
                                                      emailController.text
                                                          .trim(),
                                                      passwordController.text));
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  'Welcome, ${loginSuccess.fullName}'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyApp()));
                                        } catch (e) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                          LoginError loginError =
                                              e as LoginError;
                                          final snackBar = SnackBar(
                                              content:
                                                  Text(loginError.message));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      } else {
                                        final snackBar = SnackBar(
                                          content: Text(
                                              "Email and password are required"),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF029247)),
                                      padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                          EdgeInsets.fromLTRB(20, 15, 20, 15)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(23.0),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'TREASURER\n   SIGN IN',
                                      style: overlayStyle,
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          LoginSuccess loginSuccess =
                                              await authenticationService
                                                  .loginUser(LoginCredentials(
                                                      emailController.text
                                                          .trim(),
                                                      passwordController.text));

                                          final snackBar = SnackBar(
                                              content: Text(
                                                  'Welcome, ${loginSuccess.fullName}'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyApp()));
                                        } catch (e) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                          LoginError loginError =
                                              e as LoginError;
                                          final snackBar = SnackBar(
                                              content:
                                                  Text(loginError.message));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      } else {
                                        final snackBar = SnackBar(
                                          content: Text(
                                              "Email and password are required"),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
