import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    Key? key,
    required this.text,
    this.textColor = 0xFFFFFFFF,
    required this.fillColor,
    this.textSize = 28.0,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}