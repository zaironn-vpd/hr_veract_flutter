import 'package:flutter/material.dart';

class CustomDashboardContainer extends StatefulWidget {
  final String containerText;
  final String containerValue;
  final Icon containerIcon;
  final double containerMaxWidth;
  final double containerIfWidth;
  final double containerElseWidth;
  final double containerConstMaxWidth;

  const CustomDashboardContainer({
    super.key,
    required this.containerText,
    required this.containerValue,
    required this.containerIcon,
    required this.containerMaxWidth,
    required this.containerIfWidth,
    required this.containerElseWidth,
    required this.containerConstMaxWidth,
  });

  @override
  DashboardContainer createState() => DashboardContainer();
}

class DashboardContainer extends State<CustomDashboardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          widget.containerConstMaxWidth >= widget.containerMaxWidth
              ? widget.containerIfWidth
              : widget.containerElseWidth,
      height: 250,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(248, 249, 250, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.containerText,
            style: TextStyle(
              fontFamily: 'PoppinsBold',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              widget.containerIcon,
              Text(
                widget.containerValue,
                style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
