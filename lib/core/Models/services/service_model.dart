import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ServiceList {
  List<ServiceData> data;

  ServiceList({required this.data});

  factory ServiceList.fromJson(Map<String, dynamic> data) =>
      _$ServiceListFromJson(data);

  Map<String, dynamic> toJson() => _$ServiceListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ServiceData {
  String name;
  String title;
  String published;
  String description;
  String author;
  int hasFixedReturn;
  double fixedReturnAmount;
  String creation;
  String termsAndConditions;
  String type;
  int tenureLengthMonths;
  double roiPercentageOnCapitalInvestment;

  ServiceData(
      {required this.name,
      required this.title,
      required this.published,
      required this.description,
      required this.author,
      required this.creation,
      required this.termsAndConditions,
      required this.type,
      required this.hasFixedReturn,
      required this.tenureLengthMonths,
      required this.fixedReturnAmount,
      required this.roiPercentageOnCapitalInvestment});

  factory ServiceData.fromJson(Map<String, dynamic> data) =>
      _$ServiceDataFromJson(data);

  Map<String, dynamic> toJson() => _$ServiceDataToJson(this);
}
