import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:qube/core/enums/transaction_step.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
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
      GetIt.instance<TransactionStepCubit>().goToStepOne();
      return MaterialPage(
        child: BlocProvider(
          create: (context) => GetIt.instance<TransactionsBloc>(
            instanceName: TransactionStep.stepOne.name,
          ),
          child: const TransactionsListPage(),
        ),
      );
    },
  );

  static final _deliveryDetails = GoRoute(
    name: QubeRoutes.deliveryDetails.name,
    path: QubeRoutes.deliveryDetails.path,
    pageBuilder: (context, state) {
      GetIt.instance<TransactionStepCubit>().goToStepTwo();
      return MaterialPage(
        child: BlocProvider(
          create: (context) => GetIt.instance<TransactionsBloc>(
            instanceName: TransactionStep.stepTwo.name,
          ),
          child: const DeliveryDetailsPage(),
        ),
      );
    },
  );
}
