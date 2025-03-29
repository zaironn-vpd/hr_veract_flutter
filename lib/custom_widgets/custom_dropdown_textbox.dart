import 'package:flutter/material.dart';

class CustomDropdownTextbox extends StatefulWidget {
  final double containerWidth;
  final List<String> items;
  final String hintText;

  const CustomDropdownTextbox({
    super.key,
    required this.containerWidth,
    required this.items,
    required this.hintText,
  });

  @override
  State<CustomDropdownTextbox> createState() => _CustomDropdownTextboxState();
}

class _CustomDropdownTextboxState extends State<CustomDropdownTextbox> {
  String? selectedValue; // Stores the selected value

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              fontFamily: 'PoppinsRegular',
              letterSpacing: 2,
              fontSize: 11,
            ),
          ),
          items:
              widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      letterSpacing: 2,
                      fontSize: 11,
                    ),
                  ),
                );
              }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
