import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/profile/repository/profile_repository.dart';
import 'package:hr_veract/views/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/views/custom_widgets/custom_employee_benefits_data.dart';
import 'package:hr_veract/views/custom_widgets/custom_employee_profile_container.dart';
import 'package:hr_veract/views/custom_widgets/custom_employee_personal_data.dart';
import 'package:hr_veract/views/custom_widgets/custom_employee_work_data.dart';

class EmployeesProfileWidget extends ConsumerWidget {
  final double headerTextSize;
  final double dataTextSize;
  final double dataCellWidth;
  final double containerWidth;
  final double dataCellWidthLeft;

  const EmployeesProfileWidget({
    super.key,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.containerWidth,
    required this.dataCellWidth,
    required this.dataCellWidthLeft,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Personal Data
    // String birthDate = "January 15, 1990";
    // String gender = "Male";
    // String phoneNumber = "+63 912 345 6789";
    // String eCode = "EMP001";
    // String address = "123 Main Street, Makati City, Philippines";

    // Work Data
    // String department = "Software Development";
    // String position = "Senior Software Engineer";
    // String manager = "Jane Smith";
    // String supervisor = "Robert Brown";
    // String employeeStatus = "Full-Time";
    // String workSchedule = "Monday - Friday, 9:00 AM - 6:00 PM";
    // String hiredDate = "March 1, 2020";

    // Benefits
    // String sssNumber = "34-5678901-2";
    // String tin = "123-456-789-000";
    // String pagibigMID = "9876543210";
    // String philNumber = "123456789012";

    final tokenRepo = ref.watch(tokenRepositoryProvider);

    return FutureBuilder<bool>(
      future: tokenRepo.isTokenValid(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isValid = snapshot.data!;
        if (!isValid) {
          tokenRepo.clearToken();
          Future.microtask(() => Navigator.pushReplacementNamed(context, '/'));
        }

        return ref
            .watch(fetchProfileProvider)
            .when(
              data: (data) {
                return Scaffold(
                  backgroundColor: const Color.fromRGBO(233, 236, 239, 1),
                  appBar: CustomAppbar(title: "Profile", textSize: 18),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    "images/profilePic.jpg",
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  data.firstName,
                                  style: const TextStyle(
                                    fontFamily: "PoppinsBold",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Color.fromRGBO(44, 62, 80, 1),
                                    letterSpacing: 2,
                                  ),
                                ),
                                Text(
                                  data.role,
                                  style: const TextStyle(
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 14,
                                    color: Color.fromRGBO(44, 62, 80, 1),
                                    letterSpacing: 2,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomEmployeeProfileContainer(
                                  containerWidth: containerWidth,
                                  child: CustomEmployeePersonalData(
                                    dataCellWidthLeft: dataCellWidthLeft,
                                    headerTextSize: headerTextSize,
                                    dataTextSize: dataTextSize,
                                    dataCellWidth: dataCellWidth,
                                    fullName:
                                        '${data.firstName} ${data.lastName}',
                                    birthDate: data.birthdate,
                                    email: data.email,
                                    employeeCode: data.employeeCode,
                                    gender: data.gender,
                                    phoneNumber: data.contactNumber,
                                    address: data.address,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomEmployeeProfileContainer(
                                  containerWidth: containerWidth,
                                  child: CustomEmployeeWorkData(
                                    dataCellWidthLeft: dataCellWidthLeft,
                                    headerTextSize: headerTextSize,
                                    dataTextSize: dataTextSize,
                                    dataCellWidth: dataCellWidth,
                                    department: data.departmentName,
                                    employeeStatus: data.employeeStatus,
                                    hiredDate: data.hiredDate,
                                    manager:
                                        '${data.managerFirstName} ${data.managerLastName}',
                                    position: data.role,
                                    supervisor:
                                        '${data.supervisorFirstName} ${data.supervisorLastName}',
                                    workSchedule:
                                        "Monday - Friday ${data.timeIn} - ${data.timeOut}",
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomEmployeeProfileContainer(
                                  containerWidth: containerWidth,
                                  child: CustomEmployeeBenefitsData(
                                    dataCellWidthLeft: dataCellWidthLeft,
                                    headerTextSize: headerTextSize,
                                    dataTextSize: dataTextSize,
                                    dataCellWidth: dataCellWidth,
                                    pagibigMID: data.pagibig,
                                    philNumber: data.philhealth,
                                    sssNumber: data.sss,
                                    tin: data.tin,
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              loading:
                  () => const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ), // actual loading handled in dialog
              error:
                  (e, st) => Scaffold(
                    body: Center(
                      child: Text(
                        e.toString(),
                        style: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          fontSize: 14,
                          letterSpacing: 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ), // error also handled above
            );
      },
    );
  }
}
