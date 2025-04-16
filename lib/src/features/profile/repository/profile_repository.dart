import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/profile/domain/user_profile.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
class FetchProfile extends _$FetchProfile {
  @override
  FutureOr<UserProfile> build() async {
    return await _fetchProfile();
  }

  Future<UserProfile> _fetchProfile() async {
    try {
      final tokenRepo = ref.watch(tokenRepositoryProvider);
      final authToken = await tokenRepo.getToken();

      final url = Uri.parse('http://127.0.0.1:8000/api/employee/emp-profile');
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

        final fullUserMap = {
          'email': data['data']?['email'] ?? 'Not Set',
          'firstName': data['data']?['first_name'] ?? 'Not Set',
          'middleName': data['data']?['middle_name'] ?? 'Not Set',
          'lastName': data['data']?['last_name'] ?? 'Not Set',
          'birthdate': data['data']?['birthdate'] ?? 'Not Set',
          'gender': data['data']?['gender'] ?? 'Not Set',
          'address': data['data']?['address'] ?? 'Not Set',
          'contactNumber':
              data['data']?['contact_number']?.toString() ?? 'Not Set',
          'departmentName': data['department']?['name'] ?? 'Not Set',
          'role': data['job']?['name'] ?? 'Not Set',
          'employeeStatus': data['data']?['employee_status'] ?? 'Not Set',
          'timeIn': data['schedule']?['time_in'] ?? 'Not Set',
          'timeOut': data['schedule']?['time_out'] ?? 'Not Set',
          'hiredDate': data['data']?['hired_date'] ?? 'Not Set',
          'sss': data['data']?['sss'] ?? 'Not Set',
          'tin': data['data']?['tin'] ?? 'Not Set',
          'pagibig': data['data']?['pagibig'] ?? 'Not Set',
          'philhealth': data['data']?['philhealth'] ?? 'Not Set',
          'employeeCode': data['data']?['employee_code'] ?? 'Not Set',
          'managerFirstName':
              data['manager']?['manager_info']?['first_name'] ?? 'Not Set',
          'managerLastName':
              data['manager']?['manager_info']?['last_name'] ?? 'Not Set',
          'supervisorFirstName':
              data['supervisor']?['supervisors']?['first_name'] ?? 'Not Set',
          'supervisorLastName':
              data['supervisor']?['supervisors']?['last_name'] ?? 'Not Set',
        };
        return UserProfile.fromJson(fullUserMap);
      } else {
        throw Exception("Failed to fetch profile: ${response.statusCode}");
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
