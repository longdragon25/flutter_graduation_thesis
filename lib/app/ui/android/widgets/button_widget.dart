import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RaisedButtonCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;
  final Color borderColor;
  const RaisedButtonCustomWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: borderColor,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
