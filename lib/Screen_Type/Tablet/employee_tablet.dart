import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:hr_veract/pages/employees_profile.dart';

class EmployeesPageTablet extends StatefulWidget {
  const EmployeesPageTablet({super.key});

  @override
  Employees createState() => Employees();
}

class Employees extends State<EmployeesPageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 30,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'All Employees',
                          style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ), // Keeps spacing between text and search bar
                        Flexible(
                          child: CustomSearchBar(width: 300, textSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 700,
                            height: 525,
                            child: PaginatedDataTable2(
                              showCheckboxColumn: false,
                              headingRowColor: WidgetStateColor.resolveWith(
                                (states) => Color.fromRGBO(106, 159, 106, 1),
                              ),
                              headingRowHeight: 60,
                              dataRowHeight: 50,
                              rowsPerPage: 8,
                              columns: [
                                DataColumn(label: Text("Name")),
                                DataColumn(label: Text("Position")),
                              ],
                              source: _MyDataSource(context),
                              headingTextStyle: TextStyle(
                                fontFamily: "PoppinsBold",
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(44, 62, 80, 1),
                              ),
                              dataTextStyle: TextStyle(
                                fontFamily: "PoppinsRegular",
                                letterSpacing: 2,
                                fontSize: 10,
                                color: Color.fromRGBO(44, 62, 80, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Pressed!');
        },
        backgroundColor: Color.fromRGBO(106, 159, 106, 1),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _MyDataSource extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "name": "Employee $index",
      "code": "EMP$index",
      "position": "Developer",
    },
  );

  _MyDataSource(this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          print("Row Clicked: ${_data[index]['code']}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      EmployeesProfile(employeeCode: "${_data[index]['code']}"),
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
