import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon(
      {super.key,
      required this.color,
      required this.icon,
      required this.iconColor,
      this.iconSize});

  final Color color;
  final IconData icon;
  final Color iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize ?? 20,
      ),
    );
  }
}
