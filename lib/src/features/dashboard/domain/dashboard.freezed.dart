// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dashboard {

 String get monthlyRating; String get deduction; String get onTime; String get late; String get leave; String get leaveUsed;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.monthlyRating, monthlyRating) || other.monthlyRating == monthlyRating)&&(identical(other.deduction, deduction) || other.deduction == deduction)&&(identical(other.onTime, onTime) || other.onTime == onTime)&&(identical(other.late, late) || other.late == late)&&(identical(other.leave, leave) || other.leave == leave)&&(identical(other.leaveUsed, leaveUsed) || other.leaveUsed == leaveUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthlyRating,deduction,onTime,late,leave,leaveUsed);

@override
String toString() {
  return 'Dashboard(monthlyRating: $monthlyRating, deduction: $deduction, onTime: $onTime, late: $late, leave: $leave, leaveUsed: $leaveUsed)';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 String monthlyRating, String deduction, String onTime, String late, String leave, String leaveUsed
});




}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthlyRating = null,Object? deduction = null,Object? onTime = null,Object? late = null,Object? leave = null,Object? leaveUsed = null,}) {
  return _then(_self.copyWith(
monthlyRating: null == monthlyRating ? _self.monthlyRating : monthlyRating // ignore: cast_nullable_to_non_nullable
as String,deduction: null == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as String,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as String,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as String,leave: null == leave ? _self.leave : leave // ignore: cast_nullable_to_non_nullable
as String,leaveUsed: null == leaveUsed ? _self.leaveUsed : leaveUsed // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Dashboard implements Dashboard {
  const _Dashboard({required this.monthlyRating, required this.deduction, required this.onTime, required this.late, required this.leave, required this.leaveUsed});
  factory _Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

@override final  String monthlyRating;
@override final  String deduction;
@override final  String onTime;
@override final  String late;
@override final  String leave;
@override final  String leaveUsed;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.monthlyRating, monthlyRating) || other.monthlyRating == monthlyRating)&&(identical(other.deduction, deduction) || other.deduction == deduction)&&(identical(other.onTime, onTime) || other.onTime == onTime)&&(identical(other.late, late) || other.late == late)&&(identical(other.leave, leave) || other.leave == leave)&&(identical(other.leaveUsed, leaveUsed) || other.leaveUsed == leaveUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthlyRating,deduction,onTime,late,leave,leaveUsed);

@override
String toString() {
  return 'Dashboard(monthlyRating: $monthlyRating, deduction: $deduction, onTime: $onTime, late: $late, leave: $leave, leaveUsed: $leaveUsed)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 String monthlyRating, String deduction, String onTime, String late, String leave, String leaveUsed
});




}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthlyRating = null,Object? deduction = null,Object? onTime = null,Object? late = null,Object? leave = null,Object? leaveUsed = null,}) {
  return _then(_Dashboard(
monthlyRating: null == monthlyRating ? _self.monthlyRating : monthlyRating // ignore: cast_nullable_to_non_nullable
as String,deduction: null == deduction ? _self.deduction : deduction // ignore: cast_nullable_to_non_nullable
as String,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as String,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as String,leave: null == leave ? _self.leave : leave // ignore: cast_nullable_to_non_nullable
as String,leaveUsed: null == leaveUsed ? _self.leaveUsed : leaveUsed // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
