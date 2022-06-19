import 'package:json_annotation/json_annotation.dart';

part 'wiki_list_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class WikiList {
  late List<WikiData> data;

  WikiList({required this.data});

  factory WikiList.fromJson(Map<String, dynamic> data) =>
      _$WikiListFromJson(data);

  Map<String, dynamic> toJson() => _$WikiListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WikiData {
  late String name;
  late String title;
  late String content;
  late int published;
  late int availableToMembers;
  late String wikiType;

  WikiData(
      {required this.name,
      required this.title,
      required this.content,
      required this.published,
      required this.availableToMembers,
      required this.wikiType});

  factory WikiData.fromJson(Map<String, dynamic> data) =>
      _$WikiDataFromJson(data);

  Map<String, dynamic> toJson() => _$WikiDataToJson(this);
}
