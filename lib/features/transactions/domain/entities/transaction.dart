import 'package:equatable/equatable.dart';
import 'package:qube/features/transactions/domain/entities/item.dart';
import 'package:qube/features/transactions/domain/entities/qube_user.dart';

class Transaction extends Equatable {
  final String id;
  final String transactionNumber;
  final Sender sender;
  final Recipient recipient;
  final List<Item> items;
  final DateTime createdAt;
  final DateTime dueDate;
  final DateTime? completedAt;

  const Transaction({
    required this.id,
    required this.transactionNumber,
    required this.sender,
    required this.recipient,
    required this.items,
    required this.createdAt,
    required this.dueDate,
    this.completedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      transactionNumber,
      sender,
      recipient,
      items,
      createdAt,
      dueDate,
      completedAt,
    ];
  }
}
