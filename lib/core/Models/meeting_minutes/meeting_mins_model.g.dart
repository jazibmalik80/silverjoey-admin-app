// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_mins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingMinsList _$MeetingMinsListFromJson(Map<String, dynamic> json) {
  return MeetingMinsList(
    data: (json['data'] as List<dynamic>)
        .map((e) => MeetingMinsData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MeetingMinsListToJson(MeetingMinsList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MeetingMinsData _$MeetingMinsDataFromJson(Map<String, dynamic> json) {
  return MeetingMinsData(
    name: json['name'] as String,
    meeting: json['meeting'] as String,
    logEntry: json['log_entry'] as String,
    creation: json['creation'] as String,
  );
}

Map<String, dynamic> _$MeetingMinsDataToJson(MeetingMinsData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'meeting': instance.meeting,
      'log_entry': instance.logEntry,
      'creation': instance.creation,
    };
