import 'package:flutter/material.dart';

class CustomEmployeeBenefitsData extends StatefulWidget {
  final double headerTextSize;
  final double dataTextSize;
  final double dataCellWidth;
  final String sssNumber;
  final String tin;
  final String pagibigMID;
  final String philNumber;
  final double dataCellWidthLeft;

  const CustomEmployeeBenefitsData({
    super.key,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.dataCellWidth,
    required this.sssNumber,
    required this.tin,
    required this.pagibigMID,
    required this.philNumber,
    required this.dataCellWidthLeft,
  });

  @override
  State<CustomEmployeeBenefitsData> createState() =>
      _CustomEmployeeProfileDataState();
}

class _CustomEmployeeProfileDataState
    extends State<CustomEmployeeBenefitsData> {
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
            child: SizedBox(
              width: 10,
              child: Text(
                "Statutory Numbers",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: widget.dataCellWidthLeft,
                child: Text("SSS Number:"),
              ),
            ),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.sssNumber, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              SizedBox(width: widget.dataCellWidthLeft, child: Text("Tin:")),
            ),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.tin, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: widget.dataCellWidthLeft,
                child: Text("Pag-ibig Funds MID:"),
              ),
            ),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.pagibigMID, softWrap: true),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: widget.dataCellWidthLeft,
                child: Text("PhilHealth Number:"),
              ),
            ),
            DataCell(
              SizedBox(
                width: widget.dataCellWidth,
                child: Text(widget.philNumber, softWrap: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
