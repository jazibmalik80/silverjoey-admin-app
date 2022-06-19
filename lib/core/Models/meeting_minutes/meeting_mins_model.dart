import 'package:json_annotation/json_annotation.dart';

part 'meeting_mins_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MeetingMinsList {
  List<MeetingMinsData> data;

  MeetingMinsList({required this.data});

  factory MeetingMinsList.fromJson(Map<String, dynamic> data) =>
      _$MeetingMinsListFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingMinsListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingMinsData {
  String name;
  String meeting;
  String logEntry;
  String creation;

  MeetingMinsData(
      {required this.name,
      required this.meeting,
      required this.logEntry,
      required this.creation});

  factory MeetingMinsData.fromJson(Map<String, dynamic> data) =>
      _$MeetingMinsDataFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingMinsDataToJson(this);
}
