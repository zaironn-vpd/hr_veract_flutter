import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/custom_widgets/custom_employee_benefits_data.dart';
import 'package:hr_veract/custom_widgets/custom_employee_profile_container.dart';
import 'package:hr_veract/custom_widgets/custom_employee_personal_data.dart';
import 'package:hr_veract/custom_widgets/custom_employee_work_data.dart';

class EmployeesProfileWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // Personal Data
    String fullName = "John Doe";
    String birthDate = "January 15, 1990";
    String gender = "Male";
    String email = "johndoe@example.com";
    String phoneNumber = "+63 912 345 6789";
    String eCode = "EMP001";
    String address = "123 Main Street, Makati City, Philippines";

    // Work Data
    String department = "Software Development";
    String position = "Senior Software Engineer";
    String manager = "Jane Smith";
    String supervisor = "Robert Brown";
    String employeeStatus = "Full-Time";
    String workSchedule = "Monday - Friday, 9:00 AM - 6:00 PM";
    String hiredDate = "March 1, 2020";

    // Benefits
    String sssNumber = "34-5678901-2";
    String tin = "123-456-789-000";
    String pagibigMID = "9876543210";
    String philNumber = "123456789012";

    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbar(title: "Profile", textSize: 18),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/profilePic.jpg"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      fullName,
                      style: TextStyle(
                        fontFamily: "PoppinsBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromRGBO(44, 62, 80, 1),
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      position,
                      style: TextStyle(
                        fontFamily: "PoppinsRegular",
                        fontSize: 14,
                        color: Color.fromRGBO(44, 62, 80, 1),
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomEmployeeProfileContainer(
                      containerWidth: containerWidth,
                      child: CustomEmployeePersonalData(
                        dataCellWidthLeft: dataCellWidthLeft,
                        headerTextSize: headerTextSize,
                        dataTextSize: dataTextSize,
                        dataCellWidth: dataCellWidth,
                        fullName: fullName,
                        birthDate: birthDate,
                        email: email,
                        employeeCode: eCode,
                        gender: gender,
                        phoneNumber: phoneNumber,
                        address: address,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomEmployeeProfileContainer(
                      containerWidth: containerWidth,
                      child: CustomEmployeeWorkData(
                        dataCellWidthLeft: dataCellWidthLeft,
                        headerTextSize: headerTextSize,
                        dataTextSize: dataTextSize,
                        dataCellWidth: dataCellWidth,
                        department: department,
                        employeeStatus: employeeStatus,
                        hiredDate: hiredDate,
                        manager: manager,
                        position: position,
                        supervisor: supervisor,
                        workSchedule: workSchedule,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomEmployeeProfileContainer(
                      containerWidth: containerWidth,
                      child: CustomEmployeeBenefitsData(
                        dataCellWidthLeft: dataCellWidthLeft,
                        headerTextSize: headerTextSize,
                        dataTextSize: dataTextSize,
                        dataCellWidth: dataCellWidth,
                        pagibigMID: pagibigMID,
                        philNumber: philNumber,
                        sssNumber: sssNumber,
                        tin: tin,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
