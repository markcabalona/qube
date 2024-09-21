import 'package:flutter/material.dart';
import 'package:qube/core/widgets/shimmer_due_date_chip.dart';
import 'package:qube/core/widgets/shimmer_transaction_card.dart';

class ShimmerTransactionsListWidget extends StatelessWidget {
  const ShimmerTransactionsListWidget({
    super.key,
  });

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
