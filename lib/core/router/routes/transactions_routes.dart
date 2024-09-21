import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';
import 'package:qube/features/transactions/presentation/pages/delivery_details_page.dart';
import 'package:qube/features/transactions/presentation/pages/transactions_list_page.dart';

abstract class TransactionsRoutes {
  static final routes = [
    _transactions,
    _deliveryDetails,
  ];

  static final _transactions = GoRoute(
    name: QubeRoutes.transactions.name,
    path: QubeRoutes.transactions.path,
    pageBuilder: (context, state) {
      return const MaterialPage(
        child: TransactionsListPage(),
      );
    },
  );

  static final _deliveryDetails = GoRoute(
    name: QubeRoutes.deliveryDetails.name,
    path: QubeRoutes.deliveryDetails.path,
    redirect: (context, state) {
      if (state.extra is! Transaction) {
        return QubeRoutes.transactions.path;
      }

      return null;
    },
    pageBuilder: (context, state) {
      GetIt.instance<TransactionStepCubit>().goToStepTwo();
      return MaterialPage(
        child: DeliveryDetailsPage(
          transaction: state.extra as Transaction,
        ),
      );
    },
  );
}
