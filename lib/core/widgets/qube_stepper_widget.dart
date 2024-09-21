import 'package:flutter/material.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';

class QubeStepperWidget extends StatelessWidget {
  const QubeStepperWidget({
    super.key,
    this.index = 0,
    required this.children,
  });
  final int index;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(40),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: _getAlignment(),
            child: GradientWrapper(
              child: Container(
                width: MediaQuery.of(context).size.width / children.length,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          ),
        ],
      ),
    );
  }

  _getAlignment() {
    final pos = ((2 * index) / (children.length - 1)) - 1;
    return Alignment(pos, 0);
  }
}
