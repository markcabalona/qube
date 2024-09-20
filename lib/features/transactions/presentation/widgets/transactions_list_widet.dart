import 'package:flutter/material.dart';
import 'package:qube/core/extensions/date_time_extension.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/widgets/transaction_card.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    transactions.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final previousTransactionDueDate = switch (index) {
          0 => null,
          (_) => transactions[index - 1].dueDate,
        };

        final transaction = transactions[index];
        final shouldShowDueDate =
            !(previousTransactionDueDate?.isSameDayWith(transaction.dueDate) ??
                false);

        if (shouldShowDueDate) {
          return Column(
            children: [
              _buildDueDateChip(transaction.dueDate),
              _buildTranscationCard(transaction),
            ],
          );
        }
        return _buildTranscationCard(transaction);
      },
    );
  }

  Row _buildDueDateChip(DateTime dueDate) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Chip(
            label: Text(
              dueDate.toFormattedString(
                'MMMM dd, yyyy',
              ),
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  TransactionCard _buildTranscationCard(Transaction transaction) {
    return TransactionCard(
      transaction: transaction,
    );
  }
}
