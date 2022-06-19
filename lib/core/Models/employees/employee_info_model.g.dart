// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeList _$EmployeeListFromJson(Map<String, dynamic> json) {
  return EmployeeList(
    data: (json['data'] as List<dynamic>)
        .map((e) => EmployeeData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EmployeeListToJson(EmployeeList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) {
  return EmployeeData(
    name: json['name'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    frappeUser: json['frappe_user'] as String,
    designation: json['designation'] as String,
    profilePicture: json['profile_picture'] as String?,
    fullName: json['full_name'] as String,
  );
}

Map<String, dynamic> _$EmployeeDataToJson(EmployeeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'frappe_user': instance.frappeUser,
      'designation': instance.designation,
      'profile_picture': instance.profilePicture,
      'full_name': instance.fullName,
    };
