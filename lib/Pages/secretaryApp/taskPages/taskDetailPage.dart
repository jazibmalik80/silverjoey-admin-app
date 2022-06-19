import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/task_detail_ViewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/customAppBar.dart';

class TaskDetailPage extends StatelessWidget {
  final TasksData taskdata;

  const TaskDetailPage({Key? key, required this.taskdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarName: 'Task Detail'),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<TasksDetailViewModel>(
          create: (context) => TasksDetailViewModel(taskdata),
          child: Consumer<TasksDetailViewModel>(
            builder: (context, viewmodel, child) => Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      taskdata.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Assigned by',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.account_circle_rounded),
                              SizedBox(width: 4),
                              Text(
                                taskdata.assignedByFullName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xBD000000),
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Due Date',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            DateFormat.yMMMd('en_US').format(
                              DateTime.parse(taskdata.date),
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xBD000000),
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Task Status',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Visibility(
                        visible: viewmodel.viewState == ViewState.Busy,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 08),
                  RadioListTile<String>(
                      title: Text("Open"),
                      value: "Open",
                      groupValue: viewmodel.getTaskStatus(),
                      onChanged: (String? newValue) async {
                        await viewmodel.updateTaskStatus(newValue ?? "Open");
                      }),
                  RadioListTile<String>(
                      title: Text("Closed"),
                      value: "Closed",
                      groupValue: viewmodel.getTaskStatus(),
                      onChanged: (String? newValue) async {
                        await viewmodel.updateTaskStatus(newValue ?? "Closed");
                      }),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
