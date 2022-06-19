import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/employees/employee_info_model.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/core/Services/task_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/locator.dart';

class TasksInfoViewModel extends ChangeNotifier {
  TaskService taskService = locator<TaskService>();
  ViewState viewState = ViewState.Idle;
  TasksList? tasksList;
  EmployeeList? employeeList;
  EmployeeData? selectedEmployee;
  DateTime newTaskDateTime = DateTime.now();

  Future getAllTaskList() async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.getAllTaskInfo();

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future getTodoTaskList() async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.getTodoTaskInfo();
    print(tasksList?.data.length ?? 0);

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future getDoneTaskList() async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.getDoneTaskInfo();
    print(tasksList?.data.length ?? 0);

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future getByMeTaskList(String assigner) async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.getByMeTaskInfo(assigner);
    print(tasksList?.data.length ?? 0);

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future addNewTask(String taskDescription, String dueDate, String assignTo,
      String assignedBy) async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.postNewTask(
      taskDescription: taskDescription,
      dueDate: dueDate,
      assignTo: assignTo,
      assignedBy: assignedBy,
    );

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future updateTask(String taskID, String taskDescription, String dueDate,
      String assignTo, String assignedBy) async {
    viewState = ViewState.Busy;
    notifyListeners();

    tasksList = await taskService.editTask(
      taskID: taskID,
      taskDescription: taskDescription,
      dueDate: dueDate,
      assignTo: assignTo,
      assignedBy: assignedBy,
    );

    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future deleteTask(TasksData tasksData) async {
    int taskDeleteStatus = await taskService.delByMeTask(tasksData);
    if (taskDeleteStatus == 202) {
      if (tasksList != null)
        tasksList?.data
            .removeWhere((element) => element.name == tasksData.name);
    }
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future fetchAllEmployeeList() async {
    viewState = ViewState.Busy;
    notifyListeners();

    employeeList = await taskService.getAllEmployeeInfo();

    viewState = ViewState.Idle;
    notifyListeners();
  }

  void updateSelectedEmployee(EmployeeData? employeeData) {
    this.selectedEmployee = employeeData;
    notifyListeners();
  }

  void updateNewTaskDate(DateTime dateTime) {
    print("${dateTime.toString()} wow");
    newTaskDateTime = dateTime;
    notifyListeners();
  }

  Future doPreTaskEditOps(TasksData? editTaskData) async {
    await fetchAllEmployeeList();
    viewState = ViewState.Busy;
    selectedEmployee = employeeList?.data
        .singleWhere((element) => element.name == editTaskData?.owner);
    newTaskDateTime =
        DateTime.parse(editTaskData?.date ?? DateTime.now().toString());
    viewState = ViewState.Idle;
  }
}
