import 'package:json_annotation/json_annotation.dart';

part 'tasks_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TasksList {
  List<TasksData> data;

  TasksList({required this.data});

  factory TasksList.fromJson(Map<String, dynamic> data) =>
      _$TasksListFromJson(data);

  Map<String, dynamic> toJson() => _$TasksListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TasksData {
  String name;
  String status;
  String priority;
  String owner;
  String date;
  String description;
  String? referenceType;
  String? referenceName;
  String? role;
  String assignedBy;
  String assignedByFullName;

  TasksData({
    required this.name,
    required this.status,
    required this.priority,
    required this.owner,
    required this.date,
    required this.description,
    required this.referenceType,
    required this.referenceName,
    required this.role,
    required this.assignedBy,
    required this.assignedByFullName,
  });

  factory TasksData.fromJson(Map<String, dynamic> data) =>
      _$TasksDataFromJson(data);

  Map<String, dynamic> toJson() => _$TasksDataToJson(this);
}
