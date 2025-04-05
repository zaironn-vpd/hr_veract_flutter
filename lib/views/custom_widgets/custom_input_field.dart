import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double textFieldWidth;
  final double textSize;
  final String? textHint;
  final double? textFieldHeight;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;
  final bool enabled;
  final int maxLines;
  final String? timeDifference;
  final Color textColor;

  const InputField({
    super.key,
    required this.textFieldWidth,
    required this.textSize,
    this.textHint,
    this.textFieldHeight,
    this.horizontalPadding = 20,
    this.verticalPadding = 15,
    this.borderRadius = 15,
    this.enabled = false,
    this.maxLines = 1,
    this.timeDifference,
    this.textColor = const Color.fromRGBO(44, 62, 80, 1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textFieldWidth,
      height: textFieldHeight,
      child: TextField(
        controller: TextEditingController(text: timeDifference),
        maxLines: maxLines,
        readOnly: enabled,
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
          color: textColor,
          letterSpacing: 2,
          fontSize: textSize,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(248, 249, 250, 1),
          hintText: textHint,
          hintStyle: TextStyle(
            fontFamily: 'PoppinsRegular',
            color: Color.fromRGBO(108, 117, 125, 1),
            letterSpacing: 2,
            fontSize: textSize,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          isDense: false,
        ),
      ),
    );
  }
}
