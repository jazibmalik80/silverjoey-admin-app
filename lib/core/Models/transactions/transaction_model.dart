import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TransactionList {
  List<TransactionData> data;

  TransactionList({required this.data});

  factory TransactionList.fromJson(Map<String, dynamic> data) =>
      _$TransactionListFromJson(data);

  Map<String, dynamic> toJson() => _$TransactionListToJson(this);
}

@JsonSerializable()
class TransactionData {
  late String name;
  late String creation;
  late String transactionType;
  late String senderType;
  late String senderId;
  late String receiverType;
  late int amount;
  late String status;

  TransactionData(
      {required this.name,
      required this.creation,
      required this.transactionType,
      required this.senderType,
      required this.senderId,
      required this.receiverType,
      required this.amount,
      required this.status});

  factory TransactionData.fromJson(Map<String, dynamic> data) =>
      _$TransactionDataFromJson(data);

  Map<String, dynamic> toJson() => _$TransactionDataToJson(this);
}
