import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonTextSize;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            Color.fromRGBO(106, 159, 106, 1),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "PoppinsBold",
            letterSpacing: 2,
            color: Colors.white,
            fontSize: buttonTextSize,
          ),
        ),
      ),
    );
  }
}
