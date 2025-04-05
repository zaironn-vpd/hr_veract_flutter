import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CustomPaginatedTable extends StatefulWidget {
  final List<DataColumn> columns;
  final DataTableSource dataSource;
  final double headerTextSize;
  final double dataTextSize;
  final double headingRowHeight;
  final double dataRowHeight;
  final int rowsPerPage;
  final double columnSpacing;
  final num tableHeight;

  const CustomPaginatedTable({
    super.key,
    required this.columns,
    required this.dataSource,
    required this.headerTextSize,
    required this.dataTextSize,
    this.headingRowHeight = 50,
    this.dataRowHeight = 50,
    this.rowsPerPage = 10,
    this.columnSpacing = 3,
    this.tableHeight = 0.8,
  });

  @override
  State<CustomPaginatedTable> createState() => _CustomPaginatedTableState();
}

class _CustomPaginatedTableState extends State<CustomPaginatedTable> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double tableHeight =
        screenHeight * widget.tableHeight; // 70% of screen height

    int rowsPerPage = (tableHeight ~/ 60).clamp(5, 15);

    return SizedBox(
      height: tableHeight,
      child: PaginatedDataTable2(
        wrapInCard: false,
        showCheckboxColumn: false,
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => Color.fromRGBO(44, 62, 80, 1),
        ),
        headingRowHeight: widget.headingRowHeight,
        dataRowHeight: widget.dataRowHeight,
        rowsPerPage: rowsPerPage,
        columnSpacing: widget.columnSpacing,
        columns: widget.columns,
        source: widget.dataSource,
        headingTextStyle: TextStyle(
          fontFamily: "PoppinsBold",
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: widget.headerTextSize,
          color: Colors.white,
        ),
        dataTextStyle: TextStyle(
          fontFamily: "PoppinsRegular",
          letterSpacing: 2,
          fontSize: widget.dataTextSize,
          color: Color.fromRGBO(44, 62, 80, 1),
        ),
      ),
    );
  }
}
