import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
abstract class Memo with _$Memo {
  const factory Memo({
    required int id,
    required String subject,
    required String date,
    required String address_to,
    required String status,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
