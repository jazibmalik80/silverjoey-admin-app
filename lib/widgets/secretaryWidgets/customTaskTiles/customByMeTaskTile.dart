import 'package:flutter/material.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/editTask_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/taskDetailPage.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/utils/utils.dart';

class CustomByMeTaskTile extends StatelessWidget {
  final TasksData tasksData;
  final Function deleteTaskFunction;

  const CustomByMeTaskTile(
      {Key? key, required this.tasksData, required this.deleteTaskFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        formattedDateTimeForTasks(tasksData.date),
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
      case MenuItems.itemdedit:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditTaskPage(tasksData: tasksData),
          ),
        );
        break;
      case MenuItems.itemdelete:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Delete this task?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  await deleteTaskFunction(tasksData);
                  final snackBar = SnackBar(
                      action: SnackBarAction(
                        label: "OK",
                        onPressed: () {},
                      ),
                      content: Text("Task Deleted"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                },
                child: Text("Delete"),
              )
            ],
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
    itemdedit,
    itemdelete,
  ];

  static const itemdetails = MenuItem(
    text: 'Detail',
  );

  static const itemdedit = MenuItem(
    text: 'Edit',
  );

  static const itemdelete = MenuItem(
    text: 'Delete',
  );
}
