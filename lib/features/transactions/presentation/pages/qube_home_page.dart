import 'package:flutter/material.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';
import 'package:qube/core/widgets/qube_stepper_widget.dart';
import 'package:qube/features/transactions/presentation/widgets/search_transaction_widget.dart';

class QubeHomePage extends StatelessWidget {
  const QubeHomePage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GradientWrapper(
          child: Icon(
            Icons.abc,
            size: 60,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _onPressedProfile,
            icon: CircleAvatar(
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              foregroundColor: Theme.of(context).colorScheme.inverseSurface,
              child: const Icon(
                Icons.person_outline,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            const SearchTransactionWidget(),
            const SizedBox(height: 12),
            QubeStepperWidget(
              index: 0,
              children: List.generate(
                2,
                (index) => Text(
                  'Step ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  void _onPressedProfile() {}
}
