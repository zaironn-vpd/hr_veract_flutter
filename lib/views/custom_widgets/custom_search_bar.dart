import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final double width;
  final double textSize;
  final double? height;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomSearchBar({
    super.key,
    required this.width,
    required this.textSize,
    this.height,
    this.horizontalPadding = 20,
    this.verticalPadding = 15,
  });

  @override
  SearchBar createState() => SearchBar();
}

class SearchBar extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
          color: Color.fromRGBO(44, 62, 80, 1),
          letterSpacing: 2,
          fontSize: widget.textSize,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(248, 249, 250, 1),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontFamily: 'PoppinsRegular',
            color: Color.fromRGBO(108, 117, 125, 1),
            letterSpacing: 2,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding,
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
