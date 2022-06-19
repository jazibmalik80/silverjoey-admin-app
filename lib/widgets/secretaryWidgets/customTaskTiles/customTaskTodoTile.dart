import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/taskDetailPage.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';

class CustomTaskTodoTile extends StatelessWidget {
  final TasksData tasksData;

  const CustomTaskTodoTile({
    Key? key,
    required this.tasksData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateTimeFormat =
        DateFormat.yMMMd('en_US').format(DateTime.parse(tasksData.date));
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                  child: Text(
                    tasksData.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Chip(
                      label: Text(
                        dateTimeFormat,
                      ),
                      backgroundColor: Color(0x0D000000),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person_outlined,
                        size: 30.0,
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                            action: SnackBarAction(
                              label: "OK",
                              onPressed: () {},
                            ),
                            content: Text(
                                "Assigned by: ${tasksData.assignedByFullName}"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    PopupMenuButton<MenuItem>(
                      itemBuilder: (context) => [
                        ...MenuItems.items.map(buildItem).toList(),
                      ],
                      onSelected: (item) =>
                          onSelected(context, item, tasksData.name),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        height: 28,
        child: Text(
          item.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
      );

  void onSelected(BuildContext context, MenuItem item, String taskID) {
    switch (item) {
      case MenuItems.itemdetails:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailPage(
              taskdata: tasksData,
            ),
          ),
        );
        break;
    }
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuItems {
  static const List<MenuItem> items = [
    itemdetails,
  ];

  static const itemdetails = MenuItem(
    text: 'Detail',
  );
}



/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/taskDetailPage.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';

class CustomTaskTodoTile extends StatefulWidget {
  final TasksData tasksData;

  const CustomTaskTodoTile({required this.tasksData});

  @override
  _CustomTaskTodoTileState createState() => _CustomTaskTodoTileState();
}

class _CustomTaskTodoTileState extends State<CustomTaskTodoTile> {
  @override
  Widget build(BuildContext context) {
    String dateTimeFormat =
        DateFormat.yMMMd('en_US').format(DateTime.parse(widget.tasksData.date));
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                          child: Text(
                            widget.tasksData.description,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: 0.15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Chip(
                  label: Text(
                    dateTimeFormat,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         IconButton(
        //           icon: Icon(Icons.account_circle),
        //           onPressed: () {
        //             final snackBar = SnackBar(
        //                 action: SnackBarAction(
        //                   label: "OK",
        //                   onPressed: () {},
        //                 ),
        //                 content: Text(
        //                     "Assigned by: ${widget.tasksData.assignedByFullName}"));
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //           },
        //         ),
        //         PopupMenuButton<MenuItem>(
        //           itemBuilder: (context) => [
        //             ...MenuItems.items.map(buildItem).toList(),
        //           ],
        //           onSelected: (item) => onSelected(context, item),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        height: 28,
        child: Text(
          item.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
      );

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemdetails:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailPage(
              taskdata: widget.tasksData,
            ),
          ),
        );
        break;
    }
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuItems {
  static const List<MenuItem> items = [
    itemdetails,
  ];

  static const itemdetails = MenuItem(
    text: 'Detail',
  );
}*/
