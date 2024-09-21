import 'package:flutter/material.dart';

class ShimmerDueDateChip extends StatelessWidget {
  const ShimmerDueDateChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Chip(
            label: SizedBox(
              height: 20,
              width: 80,
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
