import 'dart:math';

import 'package:qube/features/transactions/data/datasources/transactions_datasource.dart';
import 'package:qube/features/transactions/domain/entities/qube_user.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

class DummyTransactionsDatasource implements TransactionsDatasource {
  List<Transaction> _dummyData = List.generate(
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
  );

  @override
  Future<List<Transaction>> loadTransactions({
    required int limit,
    required int offset,
    String? searchKeyword,
    int stepNumber = 1,
  }) async {
    final keyword = searchKeyword ?? '';
    await Future.delayed(Duration(milliseconds: Random().nextInt(2500)));
    _dummyData.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );
    return _dummyData
        .where(
          (element) {
            final stepNumberQuery = element.stepNumber == stepNumber;

            final addressAndTrnsactionNumberQuery =
                (element.transactionNumber.contains(keyword) ||
                    element.sender.address.contains(keyword) ||
                    element.recipient.address.contains(keyword));

            return stepNumberQuery && addressAndTrnsactionNumberQuery;
          },
        )
        .skip(offset)
        .take(limit)
        .toList();
  }

  @override
  Future<void> moveToStepTwo({
    required String transactionId,
  }) async {
    _dummyData = _dummyData.map(
      (e) {
        if (e.id == transactionId) {
          return Transaction(
            id: e.id,
            transactionNumber: e.transactionNumber,
            sender: e.sender,
            recipient: e.recipient,
            items: e.items,
            createdAt: e.createdAt,
            dueDate: e.dueDate,
            stepNumber: 2,
          );
        }
        return e;
      },
    ).toList();
  }
}
