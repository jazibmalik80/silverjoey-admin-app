// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mem_prof_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberProfileList _$MemberProfileListFromJson(Map<String, dynamic> json) {
  return MemberProfileList(
    data: (json['data'] as List<dynamic>)
        .map((e) => MemberProfileData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MemberProfileListToJson(MemberProfileList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MemberProfileData _$MemberProfileDataFromJson(Map<String, dynamic> json) {
  return MemberProfileData(
    name: json['name'] as String,
    dateJoined: json['dateJoined'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    frappeUser: json['frappeUser'] as String,
    phone: json['phone'] as String,
    fullAddress: json['fullAddress'] as String,
  );
}

Map<String, dynamic> _$MemberProfileDataToJson(MemberProfileData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateJoined': instance.dateJoined,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'frappeUser': instance.frappeUser,
      'phone': instance.phone,
      'fullAddress': instance.fullAddress,
    };
