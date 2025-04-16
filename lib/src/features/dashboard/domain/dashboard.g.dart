// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dashboard _$DashboardFromJson(Map<String, dynamic> json) => _Dashboard(
  monthlyRating: json['monthlyRating'] as String,
  deduction: json['deduction'] as String,
  onTime: json['onTime'] as String,
  late: json['late'] as String,
  leave: json['leave'] as String,
  leaveUsed: json['leaveUsed'] as String,
);

Map<String, dynamic> _$DashboardToJson(_Dashboard instance) =>
    <String, dynamic>{
      'monthlyRating': instance.monthlyRating,
      'deduction': instance.deduction,
      'onTime': instance.onTime,
      'late': instance.late,
      'leave': instance.leave,
      'leaveUsed': instance.leaveUsed,
    };
