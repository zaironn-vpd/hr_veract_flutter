import 'package:flutter/material.dart';

class CustomEmployeePersonalData extends StatefulWidget {
  final double headerTextSize;
  final double dataTextSize;
  final double dataCellWidth;
  final String fullName;
  final String birthDate;
  final String gender;
  final String address;
  final String email;
  final String phoneNumber;
  final String employeeCode;

  const CustomEmployeePersonalData({
    super.key,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.dataCellWidth,
    required this.fullName,
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.employeeCode,
  });

  @override
  State<CustomEmployeePersonalData> createState() =>
      _CustomEmployeeProfileDataState();
}

class _CustomEmployeeProfileDataState
    extends State<CustomEmployeePersonalData> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 249, 250, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 0)),
        ],
      ),
      dataRowMinHeight: 32,
      headingRowHeight: 52,
      headingTextStyle: TextStyle(
        fontFamily: "PoppinsBold",
        fontWeight: FontWeight.bold,
        fontSize: widget.headerTextSize,
        letterSpacing: 2,
      ),
      dataTextStyle: TextStyle(
        fontFamily: "Poppins Regular",
        fontSize: widget.dataTextSize,
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
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text("Full Name:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.fullName, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Birth Date:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.birthDate, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Gender:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.gender, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Address:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.address, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Email:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.email, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Phone Number:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.phoneNumber, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Employee Code:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.employeeCode, softWrap: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
