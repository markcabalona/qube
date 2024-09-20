
import 'package:flutter/material.dart';

class WarningIcon extends StatelessWidget {
  const WarningIcon({
    super.key,
    this.size = 16,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.error.withOpacity(.2),
      ),
      padding: const EdgeInsets.all(2.5),
      child: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.error,
        size: size - 2.5,
      ),
    );
  }
}
