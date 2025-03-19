import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  Employees createState() => Employees();
}

class Employees extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                            SizedBox(width: 200),
                            CustomSearchBar(),
                          ],
                        ),
                        DataTable(
                          columns: [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Email")),
                            DataColumn(label: Text("Employee Code")),
                            DataColumn(label: Text("Position")),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("John Doe")),
                                DataCell(Text("John@asdcx.com")),
                                DataCell(Text("dsa123")),
                                DataCell(Text("Software Engineer")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("John Doe")),
                                DataCell(Text("John@asdcx.com")),
                                DataCell(Text("dsa123")),
                                DataCell(Text("Software Engineer")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text("Jane Smith")),
                                DataCell(Text("Jane@asdcx.com")),
                                DataCell(Text("dasdczxc4")),
                                DataCell(Text("Product Manager")),
                              ],
                            ),
                          ],
                          headingTextStyle: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 2,
                          ),
                          dataTextStyle: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontSize: 12,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
