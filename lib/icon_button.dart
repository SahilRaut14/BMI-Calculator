import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final IconData icon;
  final Function() onpress;
  const IconButton(
    this.icon,
    this.onpress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 2.0,
      constraints: const BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      fillColor: const Color(0xff4C4F5E),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
