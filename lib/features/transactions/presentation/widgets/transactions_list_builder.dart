import 'package:flutter/material.dart';
import 'package:qube/core/extensions/date_time_extension.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/widgets/due_date_chip.dart';

class TransactionsListBuilder extends StatelessWidget {
  const TransactionsListBuilder({
    super.key,
    required this.transactions,
    required this.builder,
  });

  final List<Transaction> transactions;
  final Widget Function(BuildContext context, Transaction transaction) builder;

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
              builder(context, transaction),
            ],
          );
        }
        return builder(context, transaction);
      },
    );
  }

  DueDateChip _buildDueDateChip(DateTime dueDate) {
    return DueDateChip(
      dueDate: dueDate,
    );
  }
}
