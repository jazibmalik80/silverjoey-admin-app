// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksList _$TasksListFromJson(Map<String, dynamic> json) {
  return TasksList(
    data: (json['data'] as List<dynamic>)
        .map((e) => TasksData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TasksListToJson(TasksList instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

TasksData _$TasksDataFromJson(Map<String, dynamic> json) {
  return TasksData(
    name: json['name'] as String,
    status: json['status'] as String,
    priority: json['priority'] as String,
    owner: json['owner'] as String,
    date: json['date'] as String,
    description: json['description'] as String,
    referenceType: json['reference_type'] as String?,
    referenceName: json['reference_name'] as String?,
    role: json['role'] as String?,
    assignedBy: json['assigned_by'] as String,
    assignedByFullName: json['assigned_by_full_name'] as String,
  );
}

Map<String, dynamic> _$TasksDataToJson(TasksData instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'priority': instance.priority,
      'owner': instance.owner,
      'date': instance.date,
      'description': instance.description,
      'reference_type': instance.referenceType,
      'reference_name': instance.referenceName,
      'role': instance.role,
      'assigned_by': instance.assignedBy,
      'assigned_by_full_name': instance.assignedByFullName,
    };
