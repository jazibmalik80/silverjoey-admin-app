import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  SimpleAppBar({
    required this.appBarName,
  });

  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$appBarName',
      ),
    );
  }
}
