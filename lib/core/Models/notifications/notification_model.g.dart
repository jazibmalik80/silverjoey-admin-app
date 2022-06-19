// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) {
  return NotificationList(
    data: (json['data'] as List<dynamic>)
        .map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return NotificationData(
    name: json['name'] as String,
    subject: json['subject'] as String,
    emailContent: json['email_content'] as String,
    forUser: json['for_user'] as String,
    type: json['type'] as String,
    read: json['read'] as int,
    fromUser: json['from_user'] as String,
    creation: json['creation'] as String,
  );
}

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subject': instance.subject,
      'email_content': instance.emailContent,
      'for_user': instance.forUser,
      'type': instance.type,
      'read': instance.read,
      'from_user': instance.fromUser,
      'creation': instance.creation,
    };
