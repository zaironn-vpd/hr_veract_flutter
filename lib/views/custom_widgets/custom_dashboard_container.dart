import 'package:flutter/material.dart';

class CustomDashboardContainer extends StatefulWidget {
  final String containerText;
  final String containerValue;
  final double containerWidth;
  final double titleTextSize;
  final double valueTextSize;
  final double containerHeight;
  final Color? titleTextColor;
  final double gap;

  const CustomDashboardContainer({
    super.key,
    required this.containerText,
    required this.containerValue,
    required this.containerWidth,
    required this.titleTextSize,
    required this.valueTextSize,
    required this.containerHeight,
    this.titleTextColor = const Color.fromRGBO(44, 62, 80, 1),
    this.gap = 25,
  });

  @override
  DashboardContainer createState() => DashboardContainer();
}

class DashboardContainer extends State<CustomDashboardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(248, 249, 250, 1),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 0)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            widget.containerText,
            style: TextStyle(
              fontFamily: 'PoppinsBold',
              fontWeight: FontWeight.bold,
              fontSize: widget.titleTextSize,
              letterSpacing: 2,
              color: widget.titleTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: widget.gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.containerValue,
                style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontWeight: FontWeight.bold,
                  fontSize: widget.valueTextSize,
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
