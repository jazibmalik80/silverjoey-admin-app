// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionList _$TransactionListFromJson(Map<String, dynamic> json) {
  return TransactionList(
    data: (json['data'] as List<dynamic>)
        .map((e) => TransactionData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransactionListToJson(TransactionList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) {
  return TransactionData(
    name: json['name'] as String,
    creation: json['creation'] as String,
    transactionType: json['transactionType'] as String,
    senderType: json['senderType'] as String,
    senderId: json['senderId'] as String,
    receiverType: json['receiverType'] as String,
    amount: json['amount'] as int,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$TransactionDataToJson(TransactionData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creation': instance.creation,
      'transactionType': instance.transactionType,
      'senderType': instance.senderType,
      'senderId': instance.senderId,
      'receiverType': instance.receiverType,
      'amount': instance.amount,
      'status': instance.status,
    };
