import 'dart:math';

import 'package:qube/features/transactions/data/datasources/transactions_datasource.dart';
import 'package:qube/features/transactions/domain/entities/qube_user.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

class DummyTransactionsDatasource implements TransactionsDatasource {
  final List<Transaction> _dummyData = List.generate(
    1000,
    (index) {
      final createdAt = DateTime.now().subtract(
        Duration(
          days: Random().nextInt(30),
        ),
      );
      return Transaction(
        id: 'ID-${index + 1}',
        transactionNumber: 'DTID-$index',
        sender: Sender(
          name: 'Foo',
          address: 'Test Address $index',
          email: 'foo$index@email.com',
          phoneNumber: '',
        ),
        recipient: Recipient(
          name: 'Bar $index',
          address: 'Test Address $index',
          email: 'bar$index@email.com',
          phoneNumber: '',
        ),
        items: const [],
        createdAt: createdAt,
        dueDate: createdAt.add(
          Duration(days: Random().nextInt(365) - 20),
        ),
      );
    },
  )..sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );

  @override
  Future<List<Transaction>> loadTransactions({
    required int limit,
    required int offset,
    String? searchKeyword,
  }) async {
    final keyword = searchKeyword ?? '';
    await Future.delayed(Duration(milliseconds: Random().nextInt(2500)));
    return _dummyData
        .where(
          (element) =>
              element.transactionNumber.contains(keyword) ||
              element.sender.address.contains(keyword) ||
              element.recipient.address.contains(keyword),
        )
        .skip(offset)
        .take(limit)
        .toList();
  }
}
