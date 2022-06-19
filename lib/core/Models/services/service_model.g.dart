// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceList _$ServiceListFromJson(Map<String, dynamic> json) {
  return ServiceList(
    data: (json['data'] as List<dynamic>)
        .map((e) => ServiceData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ServiceListToJson(ServiceList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ServiceData _$ServiceDataFromJson(Map<String, dynamic> json) {
  return ServiceData(
    name: json['name'] as String,
    title: json['title'] as String,
    published: json['published'] as String,
    description: json['description'] as String,
    author: json['author'] as String,
    creation: json['creation'] as String,
    termsAndConditions: json['terms_and_conditions'] as String,
    type: json['type'] as String,
    hasFixedReturn: json['has_fixed_return'] as int,
    tenureLengthMonths: json['tenure_length_months'] as int,
    fixedReturnAmount: (json['fixed_return_amount'] as num).toDouble(),
    roiPercentageOnCapitalInvestment:
        (json['roi_percentage_on_capital_investment'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ServiceDataToJson(ServiceData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'published': instance.published,
      'description': instance.description,
      'author': instance.author,
      'has_fixed_return': instance.hasFixedReturn,
      'fixed_return_amount': instance.fixedReturnAmount,
      'creation': instance.creation,
      'terms_and_conditions': instance.termsAndConditions,
      'tenure_length_months': instance.tenureLengthMonths,
      'type': instance.type,
      'roi_percentage_on_capital_investment':
          instance.roiPercentageOnCapitalInvestment,
    };
