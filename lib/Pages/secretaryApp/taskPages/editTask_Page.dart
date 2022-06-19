import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Models/employees/employee_info_model.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/tasks_ViewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/simpleAppBar.dart';

class EditTaskPage extends StatefulWidget {
  final TasksData? tasksData;
  const EditTaskPage({Key? key, required this.tasksData}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController taskDescriptionController =
        TextEditingController();

    return Scaffold(
      appBar: SimpleAppBar(appBarName: 'Edit Task'),
      body: ChangeNotifierProvider<TasksInfoViewModel>(
        create: (context) =>
            TasksInfoViewModel()..doPreTaskEditOps(widget.tasksData),
        child: Consumer<TasksInfoViewModel>(
          builder: (context, viewmodel, child) => viewmodel.viewState ==
                  ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "TASK DESCRIPTION",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              letterSpacing: 1.35),
                        ),
                        TextFormField(
                          controller: taskDescriptionController
                            ..text = widget.tasksData!.description,
                          decoration: InputDecoration(
                            hintText: 'Task Description',
                            labelStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                          ),
                          maxLines: 4,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "DUE DATE",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              letterSpacing: 1.35),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Text(DateFormat.yMMMd('en_US')
                                  .format(viewmodel.newTaskDateTime)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)),
                            ),
                            SizedBox(width: 24),
                            GestureDetector(
                              child: Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Choose Date',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    onChanged: (date) {}, onConfirm: (date) {
                                  print('confirm $date');
                                  viewmodel.updateNewTaskDate(date);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "ASSIGN TO",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              letterSpacing: 1.35),
                        ),
                        DropdownButton<EmployeeData>(
                          isExpanded: true,
                          hint: Text('Select Employee'),
                          items: viewmodel.employeeList!.data.map((element) {
                            return DropdownMenuItem<EmployeeData>(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${element.firstName} ${element.lastName}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(element.designation,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey))
                                  ]),
                              value: element,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            viewmodel.updateSelectedEmployee(newValue);
                            print(viewmodel.selectedEmployee!.frappeUser);
                          },
                          value: viewmodel.selectedEmployee,
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF029247)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.fromLTRB(15, 10, 15, 10)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.check),
                                  SizedBox(width: 8),
                                  Text(
                                    'SAVE',
                                    style: overlayStyle,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                String assignedByEmail =
                                    Provider.of<AuthenticationViewmodel>(
                                                context,
                                                listen: false)
                                            .employeeList
                                            ?.data
                                            .first
                                            .frappeUser ??
                                        "";
                                if (assignedByEmail.isNotEmpty) {
                                  await viewmodel.updateTask(
                                    widget.tasksData?.name ?? "",
                                    taskDescriptionController.text.toString(),
                                    formattedDateTimeForTaskUpload(
                                        viewmodel.newTaskDateTime),
                                    viewmodel.selectedEmployee!.name,
                                    assignedByEmail,
                                  );
                                  final snackBar =
                                      SnackBar(content: Text('✔ Task Updated'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.pop(context, true);
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Something went wrong! Try after a few minutes'));
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
                ),
        ),
      ),
    );
  }
}
