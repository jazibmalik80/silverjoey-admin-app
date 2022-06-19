import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/appBarPages/wiki_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/appBarPages/notifications_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/loginPage.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  MainAppBar({
    required this.appBarName,
  });

  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$appBarName',
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.menu_book),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WikiPage(),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllTabPage(),
              ),
            );
          },
        ),
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final snackBar = SnackBar(content: Text("Logged out"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await Provider.of<AuthenticationViewmodel>(context, listen: false)
                  .logOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            })
      ],
    );
  }
}
