import 'package:flutter/material.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/appBarPages/wiki_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/appBarPages/notifications_Page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  CustomAppBar({
    required this.appBarName,
  });

  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$appBarName',
      ),
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
      ],
    );
  }
}
