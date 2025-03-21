import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';

class EmployeesProfile extends StatelessWidget {
  final String employeeCode;

  const EmployeesProfile({super.key, required this.employeeCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Profile"),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Icon(Icons.person, size: 100),
                            SizedBox(height: 20),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontFamily: "PoppinsBold",
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromRGBO(44, 62, 80, 1),
                              ),
                            ),
                            Text(
                              "Position",
                              style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontSize: 14,
                                color: Color.fromRGBO(44, 62, 80, 1),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 500,
                              height: 500,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 236, 239, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Information',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromRGBO(44, 62, 80, 1),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Email',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromRGBO(44, 62, 80, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
