import 'package:flutter/material.dart';

class CustomContainerWithHeader extends StatelessWidget {
  final String containerTitle;
  final double containerWidth;
  final double containerHeight;
  final Color? headerColor;
  final Color? titleTextColor;

  const CustomContainerWithHeader({
    super.key,
    required this.containerTitle,
    required this.containerWidth,
    required this.containerHeight,
    this.headerColor = const Color.fromRGBO(44, 62, 80, 1),
    this.titleTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(248, 249, 250, 1),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 0)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: containerWidth,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: headerColor,
            ),
            child: Center(
              child: Text(
                containerTitle,
                style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 2,
                  color: titleTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
