import 'package:flutter/material.dart';
import 'package:qube/core/theme/qube_theme.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';

class ShimmerTransactionCard extends StatelessWidget {
  const ShimmerTransactionCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              3,
              (index) => GradientWrapper(
                gradient: QubeTheme.shimmerLinearGradient(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 2.5),
                  width: 80 * (index + 1),
                  height: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: null,
                child: Text(
                  'Go to Step 2',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
