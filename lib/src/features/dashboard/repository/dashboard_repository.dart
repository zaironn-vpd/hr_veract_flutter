import 'dart:convert';

import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/dashboard/domain/dashboard.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'dashboard_repository.g.dart';

@riverpod
class DashboardRepository extends _$DashboardRepository {
  @override
  FutureOr<Dashboard> build() async {
    return await dashboard();
  }

  Future<Dashboard> dashboard() async {
    try {
      final tokenRepo = ref.watch(tokenRepositoryProvider);
      final authToken = await tokenRepo.getToken();

      final url = Uri.parse('http://127.0.0.1:8000/api/employee/dashboard');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $authToken",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final numberFormat = NumberFormat.currency(
          locale: 'en_PH',
          symbol: '₱',
        );

        final formattedSalary = numberFormat.format(
          double.tryParse(
                data['salary']?['currentMonthly']?.toString() ?? '0',
              ) ??
              0,
        );

        final formattedDeduction = numberFormat.format(
          double.tryParse(data['deduction']?['amount']?.toString() ?? '0') ?? 0,
        );

        final dashboardMap = {
          'monthlyRating': formattedSalary,
          'deduction': formattedDeduction,
          'onTime': data['onTime']?.toString() ?? '0',
          'late': data['late']?.toString() ?? '0',
          'leave': data['leave']?['leave_count']?.toString() ?? '0',
          'leaveUsed': data['leave']?['used_leave']?.toString() ?? '0',
        };

        return Dashboard.fromJson(dashboardMap);
      } else {
        throw Exception("Failed to fetch profile: ${response.statusCode}");
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
