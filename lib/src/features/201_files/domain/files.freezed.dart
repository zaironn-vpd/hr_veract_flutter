// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Files {

 int get id; String get date; String get title; String get type; String get filename;
/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilesCopyWith<Files> get copyWith => _$FilesCopyWithImpl<Files>(this as Files, _$identity);

  /// Serializes this Files to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Files&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,title,type,filename);

@override
String toString() {
  return 'Files(id: $id, date: $date, title: $title, type: $type, filename: $filename)';
}


}

/// @nodoc
abstract mixin class $FilesCopyWith<$Res>  {
  factory $FilesCopyWith(Files value, $Res Function(Files) _then) = _$FilesCopyWithImpl;
@useResult
$Res call({
 int id, String date, String title, String type, String filename
});




}
/// @nodoc
class _$FilesCopyWithImpl<$Res>
    implements $FilesCopyWith<$Res> {
  _$FilesCopyWithImpl(this._self, this._then);

  final Files _self;
  final $Res Function(Files) _then;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? title = null,Object? type = null,Object? filename = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Files implements Files {
  const _Files({required this.id, required this.date, required this.title, required this.type, required this.filename});
  factory _Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

@override final  int id;
@override final  String date;
@override final  String title;
@override final  String type;
@override final  String filename;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilesCopyWith<_Files> get copyWith => __$FilesCopyWithImpl<_Files>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Files&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,title,type,filename);

@override
String toString() {
  return 'Files(id: $id, date: $date, title: $title, type: $type, filename: $filename)';
}


}

/// @nodoc
abstract mixin class _$FilesCopyWith<$Res> implements $FilesCopyWith<$Res> {
  factory _$FilesCopyWith(_Files value, $Res Function(_Files) _then) = __$FilesCopyWithImpl;
@override @useResult
$Res call({
 int id, String date, String title, String type, String filename
});




}
/// @nodoc
class __$FilesCopyWithImpl<$Res>
    implements _$FilesCopyWith<$Res> {
  __$FilesCopyWithImpl(this._self, this._then);

  final _Files _self;
  final $Res Function(_Files) _then;

/// Create a copy of Files
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? title = null,Object? type = null,Object? filename = null,}) {
  return _then(_Files(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
