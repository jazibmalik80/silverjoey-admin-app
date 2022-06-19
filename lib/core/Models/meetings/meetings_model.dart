import 'package:json_annotation/json_annotation.dart';

part 'meetings_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MeetingList {
  List<MeetingData> data;

  MeetingList({required this.data});

  factory MeetingList.fromJson(Map<String, dynamic> data) =>
      _$MeetingListFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingData {
  String name;
  String title;
  String agenda;
  String meetingDate;
  int notifyAllEmployees;
  String creation;

  MeetingData(
      {required this.name,
      required this.title,
      required this.agenda,
      required this.meetingDate,
      required this.notifyAllEmployees,
      required this.creation});

  factory MeetingData.fromJson(Map<String, dynamic> data) =>
      _$MeetingDataFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingDataToJson(this);
}
