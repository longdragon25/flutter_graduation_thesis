import 'package:flutter/material.dart';

class CircleItemWidget extends StatelessWidget {
  const CircleItemWidget(
      {Key? key, this.size = 40, required this.child, this.colorBackground})
      : super(key: key);

  final double? size;
  final Widget child;
  final Color? colorBackground;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size! / 2),
          color: colorBackground),
      child: child,
    );
  }
}
