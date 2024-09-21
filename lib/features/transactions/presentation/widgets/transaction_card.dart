import 'package:flutter/material.dart';
import 'package:qube/core/extensions/date_time_extension.dart';
import 'package:qube/core/router/qube_router.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/core/widgets/dot_icon.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';
import 'package:qube/core/widgets/warning_icon.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final labelSmall = themeData.textTheme.labelSmall?.copyWith(
      color: themeData.colorScheme.onSurface.withOpacity(.5),
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimeAndWarningSection(
              labelSmall,
            ),
            Text(
              '#${transaction.transactionNumber}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            _buildSenderTpRecipientSection(
              labelSmall,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _onPressGoToStep2,
                child: const GradientWrapper(
                  child: Text(
                    'Go to Step 2',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTimeAndWarningSection(TextStyle? style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          transaction.createdAt.toFormattedString('hh:mm aa'),
          style: style,
        ),
        if (transaction.dueDate.isBefore(DateTime.now())) const WarningIcon()
      ],
    );
  }

  Row _buildSenderTpRecipientSection(TextStyle? style) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DotIcon.filled(),
        const SizedBox(width: 2.5),
        Text(
          transaction.sender.address,
          style: style,
        ),
        const Icon(
          Icons.arrow_right_alt_sharp,
        ),
        const DotIcon.outlined(),
        const SizedBox(width: 2.5),
        Text(
          transaction.recipient.name,
          style: style,
        ),
      ],
    );
  }

  void _onPressGoToStep2() {
    QubeRouter.go(
      QubeRoutes.deliveryDetails,
      extra: transaction,
    );
  }
}
