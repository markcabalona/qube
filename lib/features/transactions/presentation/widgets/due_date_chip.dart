import 'package:flutter/material.dart';
import 'package:qube/core/extensions/date_time_extension.dart';

class DueDateChip extends StatelessWidget {
  const DueDateChip({
    super.key,
    required this.dueDate,
  });
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
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
}
