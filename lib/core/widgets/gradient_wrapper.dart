import 'package:flutter/material.dart';
import 'package:qube/core/extensions/build_context_extension.dart';
import 'package:qube/core/theme/qube_theme.dart';

class GradientWrapper extends StatelessWidget {
  const GradientWrapper({
    super.key,
    required this.child,
    this.gradient,
  });
  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final gradient0 = gradient ??
        QubeTheme.mainLinearGradient(
          context.themeMode,
        );
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient0.createShader(
        bounds,
      ),
      child: child,
    );
  }
}
