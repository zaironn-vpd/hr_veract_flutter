import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_dashboard_container.dart';

class DashboardWidget extends StatefulWidget {
  final double containerWidth;
  final double titleTextSize;
  final double valueTextSize;
  final double buttonWidth;
  final double buttonTextSize;

  const DashboardWidget({
    super.key,
    required this.containerWidth,
    required this.titleTextSize,
    required this.valueTextSize,
    required this.buttonWidth,
    required this.buttonTextSize,
  });

  @override
  DashboardWidgetState createState() => DashboardWidgetState();
}

class DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(),
      drawer: CustomAppbarDrawer(),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder:
              (context, constraints) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(),
                            Text(
                              'Salary',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'Monthly Rating',
                                  containerValue: '18,000',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.green[300],
                                ),
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'Deduction',
                                  containerValue: '18,000',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.red[300],
                                ),
                              ],
                            ),
                            SizedBox(),
                            Text(
                              'Attendance',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'On-time',
                                  containerValue: '365',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.green[300],
                                ),
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'Late/s',
                                  containerValue: '0',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.red[300],
                                ),
                              ],
                            ),
                            SizedBox(),
                            Text(
                              'Available Leave/s',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'Balance',
                                  containerValue: '365',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.green[300],
                                ),
                                CustomDashboardContainer(
                                  containerWidth: widget.containerWidth,
                                  containerHeight: 100,
                                  containerText: 'Used',
                                  containerValue: '0',
                                  valueTextSize: widget.valueTextSize,
                                  titleTextSize: widget.titleTextSize,
                                  titleTextColor: Colors.red[300],
                                ),
                              ],
                            ),
                            SizedBox(),
                            Text(
                              'Create Form',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomButton(
                                  onPressed: () {},
                                  buttonHeight: 50,
                                  buttonText: "Overtime Form",
                                  buttonWidth: widget.buttonWidth,
                                  buttonTextSize: widget.buttonTextSize,
                                ),
                                CustomButton(
                                  onPressed: () {},
                                  buttonHeight: 50,
                                  buttonText: "Leave Form",
                                  buttonWidth: widget.buttonWidth,
                                  buttonTextSize: widget.buttonTextSize,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
