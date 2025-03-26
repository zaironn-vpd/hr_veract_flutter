import 'package:flutter/material.dart';

class CustomPopupDialog extends StatefulWidget {
  final double popUpWidth;
  final List<Widget> contents;

  const CustomPopupDialog({
    super.key,
    this.popUpWidth = 200,
    required this.contents,
  });

  @override
  State<CustomPopupDialog> createState() => _PopupDialogState();
}

class _PopupDialogState extends State<CustomPopupDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: widget.popUpWidth,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.contents,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
