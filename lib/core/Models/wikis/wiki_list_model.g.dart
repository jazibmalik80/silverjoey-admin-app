// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikiList _$WikiListFromJson(Map<String, dynamic> json) {
  return WikiList(
    data: (json['data'] as List<dynamic>)
        .map((e) => WikiData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WikiListToJson(WikiList instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

WikiData _$WikiDataFromJson(Map<String, dynamic> json) {
  return WikiData(
    name: json['name'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    published: json['published'] as int,
    availableToMembers: json['available_to_members'] as int,
    wikiType: json['wiki_type'] as String,
  );
}

Map<String, dynamic> _$WikiDataToJson(WikiData instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'content': instance.content,
      'published': instance.published,
      'available_to_members': instance.availableToMembers,
      'wiki_type': instance.wikiType,
    };
