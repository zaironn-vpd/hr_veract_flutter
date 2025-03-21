import 'package:flutter/material.dart';

class CustomEmployeeWorkData extends StatefulWidget {
  final double headerTextSize;
  final double dataTextSize;
  final double dataCellWidth;
  final String department;
  final String position;
  final String manager;
  final String supervisor;
  final String employeeStatus;
  final String workSchedule;
  final String hiredDate;

  const CustomEmployeeWorkData({
    super.key,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.dataCellWidth,
    required this.department,
    required this.position,
    required this.manager,
    required this.supervisor,
    required this.employeeStatus,
    required this.workSchedule,
    required this.hiredDate,
  });

  @override
  State<CustomEmployeeWorkData> createState() =>
      _CustomEmployeeProfileDataState();
}

class _CustomEmployeeProfileDataState extends State<CustomEmployeeWorkData> {
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
              "Work Format",
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
            DataCell(Text("Department:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.department, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Position:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.position, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Manager:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.manager, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Supervisor:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.supervisor, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Employee Status:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.employeeStatus, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Work Schedule:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.workSchedule, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Hired Date:")),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.hiredDate, softWrap: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
