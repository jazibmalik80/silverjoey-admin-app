import 'package:json_annotation/json_annotation.dart';

part 'employee_info_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class EmployeeList {
  List<EmployeeData> data;

  EmployeeList({required this.data});

  factory EmployeeList.fromJson(Map<String, dynamic> data) =>
      _$EmployeeListFromJson(data);

  Map<String, dynamic> toJson() => _$EmployeeListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EmployeeData {
  String name;
  String firstName;
  String lastName;
  String frappeUser;
  String designation;
  String? profilePicture;
  String fullName;

  EmployeeData(
      {required this.name,
      required this.firstName,
      required this.lastName,
      required this.frappeUser,
      required this.designation,
      required this.profilePicture,
      required this.fullName});

  factory EmployeeData.fromJson(Map<String, dynamic> data) =>
      _$EmployeeDataFromJson(data);

  Map<String, dynamic> toJson() => _$EmployeeDataToJson(this);
}
