import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String email,
    required String firstName,
    required String middleName,
    required String lastName,
    required String birthdate,
    required String gender,
    required String address,
    required String contactNumber,
    required String departmentName,
    required String role,
    required String employeeStatus,
    required String timeIn,
    required String timeOut,
    required String hiredDate,
    required String sss,
    required String tin,
    required String pagibig,
    required String philhealth,
    required String employeeCode,
    required String managerFirstName,
    required String managerLastName,
    required String supervisorFirstName,
    required String supervisorLastName,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
