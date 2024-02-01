import 'package:flutter/material.dart';

import 'constants.dart';
// ignore: unused_import
import 'result_page.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function() onpress;
  const BottomButton(
    this.label,
    this.onpress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 60.0,
        width: double.infinity,
        color: kbottomCardColor,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
