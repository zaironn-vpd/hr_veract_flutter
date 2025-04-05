import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final double navTextSize;
  final List<String>? navTitle;
  final Function(int) pageIndex;

  const CustomNavBar({
    super.key,
    required this.navTextSize,
    this.navTitle = const ["Home", "Search", "Profile"],
    required this.pageIndex,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    widget.pageIndex(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            _selectedIndex == 0
                                ? Color.fromRGBO(106, 159, 106, 1)
                                : Colors.grey,
                        width: _selectedIndex == 0 ? 3 : 0,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: _buildNavItem(widget.navTitle![0], 0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            _selectedIndex == 1
                                ? Color.fromRGBO(106, 159, 106, 1)
                                : Colors.grey,
                        width: _selectedIndex == 1 ? 3 : 0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: _buildNavItem(widget.navTitle![1], 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'PoppinsBold',
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: widget.navTextSize,
              color:
                  _selectedIndex == index
                      ? Color.fromRGBO(106, 159, 106, 1)
                      : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
