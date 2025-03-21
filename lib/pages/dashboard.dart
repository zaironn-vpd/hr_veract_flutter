import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hr_veract/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:hr_veract/custom_widgets/custom_dashboard_container.dart';
import 'package:hr_veract/pages/dashboard.dart';
import 'package:hr_veract/pages/employee_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageDesign createState() => DashboardPageDesign();
}

class DashboardPageDesign extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder:
                (context, constraints) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    constraints.maxWidth > 1100
                        ? Column(
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomDashboardContainer(
                                  containerConstMaxWidth: constraints.maxWidth,
                                  containerMaxWidth: 560,
                                  containerIfWidth: 500,
                                  containerElseWidth: 200,
                                  containerText: 'Total Employees',
                                  containerValue: '22',
                                  containerIcon: Icon(Icons.people, size: 60),
                                ),
                                CustomDashboardContainer(
                                  containerConstMaxWidth: constraints.maxWidth,
                                  containerMaxWidth: 560,
                                  containerIfWidth: 500,
                                  containerElseWidth: 200,
                                  containerText: 'Department Count',
                                  containerValue: '25',
                                  containerIcon: Icon(
                                    Icons.business_rounded,
                                    size: 60,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomDashboardContainer(
                                  containerConstMaxWidth: constraints.maxWidth,
                                  containerMaxWidth: 560,
                                  containerIfWidth: 500,
                                  containerElseWidth: 200,
                                  containerText: 'New Employees',
                                  containerValue: '14',
                                  containerIcon: Icon(Icons.person, size: 60),
                                ),
                                CustomDashboardContainer(
                                  containerConstMaxWidth: constraints.maxWidth,
                                  containerMaxWidth: 560,
                                  containerIfWidth: 500,
                                  containerElseWidth: 200,
                                  containerText: 'Job Count',
                                  containerValue: '30',
                                  containerIcon: Icon(
                                    Icons.business_center,
                                    size: 60,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                letterSpacing: 2,
                              ),
                            ),
                            CustomDashboardContainer(
                              containerConstMaxWidth: constraints.maxWidth,
                              containerMaxWidth: 560,
                              containerIfWidth: 500,
                              containerElseWidth: 200,
                              containerText: 'Total Employees',
                              containerValue: '22',
                              containerIcon: Icon(Icons.people, size: 60),
                            ),
                            SizedBox(height: 10),
                            CustomDashboardContainer(
                              containerConstMaxWidth: constraints.maxWidth,
                              containerMaxWidth: 560,
                              containerIfWidth: 500,
                              containerElseWidth: 200,
                              containerText: 'Department Count',
                              containerValue: '25',
                              containerIcon: Icon(
                                Icons.business_rounded,
                                size: 60,
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomDashboardContainer(
                              containerConstMaxWidth: constraints.maxWidth,
                              containerMaxWidth: 560,
                              containerIfWidth: 500,
                              containerElseWidth: 200,
                              containerText: 'New Employees',
                              containerValue: '14',
                              containerIcon: Icon(Icons.person, size: 60),
                            ),
                            SizedBox(height: 10),
                            CustomDashboardContainer(
                              containerConstMaxWidth: constraints.maxWidth,
                              containerMaxWidth: 560,
                              containerIfWidth: 500,
                              containerElseWidth: 200,
                              containerText: 'Job Count',
                              containerValue: '30',
                              containerIcon: Icon(
                                Icons.business_center,
                                size: 60,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }
}
