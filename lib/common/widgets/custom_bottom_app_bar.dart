import 'package:finances/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar(
      {super.key, this.selectedItemColor, required this.children})
      : assert(children.length == 5, 'The children must have exactly 5 items');

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          final currentItem = widget.children.indexOf(item) == _selectedIndex;
          return Expanded(
              child: InkWell(
                onTap: item.onPressed,
                onTapUp: (_) => setState(() {
                  _selectedIndex = widget.children.indexOf(item);
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(
                    currentItem ? item.primaryIcon : item.secondaryIcon,
                    color: currentItem
                        ? widget.selectedItemColor
                        : AppColors.gray,
                  ),
                ),
          )
          );
        }
        ).toList(),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  final String? label;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback? onPressed;

  const CustomBottomAppBarItem(
      {this.label, this.primaryIcon, this.secondaryIcon, this.onPressed});

  const CustomBottomAppBarItem.empty(
      {this.label, this.primaryIcon, this.secondaryIcon, this.onPressed});
}
