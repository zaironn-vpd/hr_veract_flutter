// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  userName: json['userName'] as String,
  password: json['password'] as String,
  apiToken: json['apiToken'] as String,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'userName': instance.userName,
  'password': instance.password,
  'apiToken': instance.apiToken,
};
