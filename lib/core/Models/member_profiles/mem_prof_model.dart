import 'package:json_annotation/json_annotation.dart';

part 'mem_prof_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MemberProfileList {
  List<MemberProfileData> data;

  MemberProfileList({required this.data});

  factory MemberProfileList.fromJson(Map<String, dynamic> data) =>
      _$MemberProfileListFromJson(data);

  Map<String, dynamic> toJson() => _$MemberProfileListToJson(this);
}

@JsonSerializable()
class MemberProfileData {
  String name;
  String dateJoined;
  String firstName;
  String lastName;
  String frappeUser;
  String phone;
  String fullAddress;

  MemberProfileData(
      {required this.name,
      required this.dateJoined,
      required this.firstName,
      required this.lastName,
      required this.frappeUser,
      required this.phone,
      required this.fullAddress});

  factory MemberProfileData.fromJson(Map<String, dynamic> data) =>
      _$MemberProfileDataFromJson(data);

  Map<String, dynamic> toJson() => _$MemberProfileDataToJson(this);
}
