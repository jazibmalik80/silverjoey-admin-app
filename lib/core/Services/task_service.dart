import 'package:dio/dio.dart';
import 'package:sj_secretary_app/core/Models/employees/employee_info_model.dart';
import 'package:sj_secretary_app/core/Models/tasks/tasks_model.dart';
import 'package:sj_secretary_app/core/Services/dio_service.dart';
import 'package:sj_secretary_app/core/Services/endpoints.dart';
import 'package:sj_secretary_app/locator.dart';

class TaskService {
  DioService dioService = locator<DioService>();

  Future<TasksList> getAllTaskInfo() async {
    Response taskResponse =
        await dioService.get().get("$baseUrl/$GET_Alltasks");
    print(taskResponse.data);
    return TasksList.fromJson(taskResponse.data);
  }

  Future<TasksList> getTodoTaskInfo() async {
    Response taskResponse =
        await dioService.get().get("$baseUrl/$GET_Todotasks");
    print(taskResponse.data);
    return TasksList.fromJson(taskResponse.data);
  }

  Future<TasksList> getDoneTaskInfo() async {
    Response taskResponse =
        await dioService.get().get("$baseUrl/$GET_Donetasks");
    print(taskResponse.data);
    return TasksList.fromJson(taskResponse.data);
  }

  Future<TasksList> getByMeTaskInfo(String assigned) async {
    Response taskResponse = await dioService.get().get(
        '''$baseUrl/$GET_Bymetasks&filters=[["assigned_by","=","$assigned"]]''');
    print(taskResponse.data);
    return TasksList.fromJson(taskResponse.data);
  }

  Future<TasksData> updateTaskStatus(
      TasksData tasksData, String updatedStatus) async {
    Response taskResponse = await dioService.get().put(
        "$baseUrl/resource/Task/${tasksData.name}",
        data: {"status": "$updatedStatus"});
    if (taskResponse.statusCode == 200) {
      TasksData tasksData = TasksData.fromJson(taskResponse.data['data']);
      return tasksData;
    } else
      return tasksData;
  }

  Future postNewTask(
      {required String taskDescription,
      required String dueDate,
      required String assignTo,
      required String assignedBy}) async {
    Response taskResponse =
        await dioService.get().post('''$baseUrl/resource/Task''', data: {
      "description": "$taskDescription",
      "date": "$dueDate",
      "owner": "$assignTo",
      "assigned_by": "$assignedBy",
    });
    print(taskResponse.statusCode);
  }

  Future editTask(
      {required String taskID,
      required String taskDescription,
      required String dueDate,
      required String assignTo,
      required String assignedBy}) async {
    Response taskResponse =
        await dioService.get().put('''$baseUrl/resource/Task/$taskID''', data: {
      "description": "$taskDescription",
      "date": "$dueDate",
      "owner": "$assignTo",
      "assigned_by": "$assignedBy",
    });
    print(taskResponse.statusCode);
  }

  Future<int> delByMeTask(TasksData tasksData) async {
    Response taskResponse = await dioService
        .get()
        .delete("$baseUrl/resource/Task/${tasksData.name}");
    return taskResponse.statusCode ?? 404;
  }

  Future<EmployeeList> getAllEmployeeInfo() async {
    Response employeeResponse =
        await dioService.get().get("$baseUrl/$Get_MemberInfo");
    print(employeeResponse.data);
    return EmployeeList.fromJson(employeeResponse.data);
  }
}
