import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';

class EmployeesProfileMobile extends StatelessWidget {
  final String employeeCode;

  const EmployeesProfileMobile({super.key, required this.employeeCode});

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
                              margin: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 236, 239, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: DataTable(
                                dataRowMinHeight: 32,
                                headingTextStyle: TextStyle(
                                  fontFamily: "PoppinsBold",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                ),
                                dataTextStyle: TextStyle(
                                  fontFamily: "Poppins Regular",
                                  fontSize: 8,
                                ),
                                columns: [
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        "Personal Information",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        "",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ), // Empty column if needed
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(Text("Full Name:")),
                                      DataCell(Text("John Doe")),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text("Code:")),
                                      DataCell(Text("WQEW")),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text("Phone Number:")),
                                      DataCell(Text("091234567890")),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text("Email:")),
                                      DataCell(
                                        Text("12345678901234@gmail.com"),
                                      ),
                                    ],
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
