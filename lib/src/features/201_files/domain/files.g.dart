// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Files _$FilesFromJson(Map<String, dynamic> json) => _Files(
  id: (json['id'] as num).toInt(),
  date: json['date'] as String,
  title: json['title'] as String,
  type: json['type'] as String,
  filename: json['filename'] as String,
);

Map<String, dynamic> _$FilesToJson(_Files instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'title': instance.title,
  'type': instance.type,
  'filename': instance.filename,
};
