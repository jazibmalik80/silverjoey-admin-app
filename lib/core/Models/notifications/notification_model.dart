import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NotificationList {
  List<NotificationData> data;

  NotificationList({required this.data});

  factory NotificationList.fromJson(Map<String, dynamic> data) =>
      _$NotificationListFromJson(data);

  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificationData {
  String name;
  String subject;
  String emailContent;
  String forUser;
  String type;
  int read;
  String fromUser;
  String creation;

  NotificationData(
      {required this.name,
      required this.subject,
      required this.emailContent,
      required this.forUser,
      required this.type,
      required this.read,
      required this.fromUser,
      required this.creation});

  factory NotificationData.fromJson(Map<String, dynamic> data) =>
      _$NotificationDataFromJson(data);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
