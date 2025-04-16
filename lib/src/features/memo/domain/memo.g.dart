// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Memo _$MemoFromJson(Map<String, dynamic> json) => _Memo(
  id: (json['id'] as num).toInt(),
  subject: json['subject'] as String,
  date: json['date'] as String,
  address_to: json['address_to'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$MemoToJson(_Memo instance) => <String, dynamic>{
  'id': instance.id,
  'subject': instance.subject,
  'date': instance.date,
  'address_to': instance.address_to,
  'status': instance.status,
};
