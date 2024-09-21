import 'package:flutter/material.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/widgets/delivery_details_form_widget.dart';
import 'package:qube/features/transactions/presentation/widgets/due_date_chip.dart';

class DeliveryDetailsPage extends StatelessWidget {
  const DeliveryDetailsPage({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DueDateChip(dueDate: transaction.dueDate),
          const SizedBox(height: 10),
          DeliveryDetailsFormWidget(
            transaction: transaction,
          ),
        ],
      ),
    );
  }
}
