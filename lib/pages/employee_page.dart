import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/employee_page_widget.dart';
import 'package:hr_veract/page_widget/employee_profile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  Employees createState() => Employees();
}

class Employees extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double headerTextSize;
        double dataTextSize;
        double containerWidth;
        double dataCellWidth;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          headerTextSize = 10;
          dataTextSize = 10;
          containerWidth = 500;
          dataCellWidth = 115;
        } else {
          headerTextSize = 12;
          dataTextSize = 12;
          containerWidth = 700;
          dataCellWidth = 250;
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return EmployeesPageWidget(
            searchBoxWidth: 150,
            searchBoxTextSize: 8,
            headerTextSize: 12,
            dataTextSize: 10,
            dataTableSource: _MyDataSource(
              context,
              headerTextSize,
              dataTextSize,
              containerWidth,
              dataCellWidth,
            ),
          );
        } else {
          return EmployeesPageWidget(
            searchBoxWidth: 300,
            searchBoxTextSize: 12,
            headerTextSize: 16,
            dataTextSize: 14,
            dataTableSource: _MyDataSource(
              context,
              headerTextSize,
              dataTextSize,
              containerWidth,
              dataCellWidth,
            ),
          );
        }
      },
    );
  }
}

class _MyDataSource extends DataTableSource {
  final BuildContext context;
  final double headerTextSize;
  final double dataTextSize;
  final double containerWidth;
  final double dataCellWidth;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "name": "Employee $index",
      "code": "EMP$index",
      "position": "Developer",
    },
  );

  _MyDataSource(
    this.context,
    this.headerTextSize,
    this.dataTextSize,
    this.containerWidth,
    this.dataCellWidth,
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => EmployeesProfileWidget(
                    // employeeCode: "${_data[index]['code']}",
                    containerWidth: containerWidth,
                    dataTextSize: dataTextSize,
                    headerTextSize: headerTextSize,
                    dataCellWidth: dataCellWidth,
                    dataCellWidthLeft: 2,
                  ),
            ),
          );
        }
      },
      cells: [DataCell(Text(row["name"]!)), DataCell(Text(row["position"]!))],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
}
