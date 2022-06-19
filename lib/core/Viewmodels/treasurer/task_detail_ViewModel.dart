import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/core/Services/task_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/locator.dart';

class TasksDetailViewModel extends ChangeNotifier {
  TaskService taskService = locator<TaskService>();
  ViewState viewState = ViewState.Idle;

  final TasksData tasksData;

  TasksDetailViewModel(this.tasksData);

  Future updateTaskStatus(String updatedstatus) async {
    viewState = ViewState.Busy;
    notifyListeners();
    TasksData updated =
        await taskService.updateTaskStatus(tasksData, updatedstatus);
    tasksData.status = updated.status;
    viewState = ViewState.Idle;
    notifyListeners();
  }

  String getTaskStatus() => tasksData.status;
  bool isTaskCancelled() => tasksData.status == "Cancelled";
}
