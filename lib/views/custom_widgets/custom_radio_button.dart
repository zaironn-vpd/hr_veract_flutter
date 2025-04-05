import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedValue = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text(
            "Option 1",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          leading: Radio<String>(
            value: "Option 1",
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            "Option 2",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          leading: Radio<String>(
            value: "Option 2",
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
