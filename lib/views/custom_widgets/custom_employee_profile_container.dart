import 'package:flutter/material.dart';

class CustomEmployeeProfileContainer extends StatefulWidget {
  final double containerWidth;
  final Widget? child;

  const CustomEmployeeProfileContainer({
    super.key,
    required this.containerWidth,
    required this.child,
  });

  @override
  State<CustomEmployeeProfileContainer> createState() =>
      _CustomEmployeeProfileContainerState();
}

class _CustomEmployeeProfileContainerState
    extends State<CustomEmployeeProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 249, 250, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 0)),
        ],
      ),
      child: widget.child,
    );
  }
}
