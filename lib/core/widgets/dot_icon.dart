import 'package:flutter/material.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';

class DotIcon extends StatelessWidget {
  const DotIcon.filled({
    super.key,
    this.color,
    this.gradient,
  }) : isFilled = true;

  const DotIcon.outlined({
    super.key,
    this.color,
    this.gradient,
  }) : isFilled = false;
  final bool isFilled;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    assert(!(color != null && gradient != null));
    final icon = Icon(
      isFilled ? Icons.circle : Icons.circle_outlined,
      color: color,
      size: 10,
    );
    if (color == null) {
      return GradientWrapper(
        gradient: gradient,
        child: icon,
      );
    }
    return icon;
  }
}
