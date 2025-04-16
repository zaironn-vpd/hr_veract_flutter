import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'files.freezed.dart';
part 'files.g.dart';

@freezed
abstract class Files with _$Files {
  const factory Files({
    required int id,
    required String date,
    required String title,
    required String type,
    required String filename,
  }) = _Files;

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);
}
