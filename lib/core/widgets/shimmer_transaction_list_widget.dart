import 'package:flutter/material.dart';
import 'package:qube/core/widgets/shimmer_due_date_chip.dart';
import 'package:qube/core/widgets/shimmer_transaction_card.dart';

class ShimmerTransactionsListWidget extends StatefulWidget {
  const ShimmerTransactionsListWidget({
    super.key,
  });

  @override
  State<ShimmerTransactionsListWidget> createState() =>
      _ShimmerTransactionsListWidgetState();
}

class _ShimmerTransactionsListWidgetState
    extends State<ShimmerTransactionsListWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..repeat(period: const Duration(milliseconds: 1000))
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  _buildDueDateChip(),
                  _buildTranscationCard(),
                ],
              );
            }
            return _buildTranscationCard();
          },
        ),
      ],
    );
  }

  ShimmerDueDateChip _buildDueDateChip() {
    return const ShimmerDueDateChip();
  }

  ShimmerTransactionCard _buildTranscationCard() {
    return const ShimmerTransactionCard();
  }
}
