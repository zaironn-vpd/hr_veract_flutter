import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
abstract class Dashboard with _$Dashboard {
  const factory Dashboard({
    required String monthlyRating,
    required String deduction,
    required String onTime,
    required String late,
    required String leave,
    required String leaveUsed,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
