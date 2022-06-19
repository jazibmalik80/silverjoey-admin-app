import 'package:flutter/material.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/allTab_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/bymeTab_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/doneTab_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/newTask_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/taskPages/todoTab_Page.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/mainAppBar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarName: "Tasks"),
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(text: 'ALL'),
                  Tab(text: 'TODO'),
                  Tab(text: 'DONE'),
                  Tab(text: 'BY ME'),
                ],
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(
                  children: [
                    AllTaskPage(),
                    TodoTabPage(),
                    DoneTabPage(),
                    ByMeTabPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'NEW TASK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskPage(),
            ),
          );
        },
      ),
    );
  }
}
