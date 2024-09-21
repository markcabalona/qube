import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qube/core/enums/app_status.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/widgets/transactions_list_widet.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.instance<TransactionsBloc>();
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (notification) {
        final shouldFetchMore = notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 100;

        if (shouldFetchMore && bloc.state.shouldFetchMore) {
          bloc.add(const LoadTransactionsEvent());
        }
        return true;
      },
      child: BlocBuilder<TransactionsBloc, TransactionsState>(
        bloc: bloc,
        buildWhen: (previous, current) {
          if (current.status == AppStatus.initial) {
            bloc.add(const LoadTransactionsEvent());
          }
          return current.status == AppStatus.success;
        },
        builder: (context, state) {
          if (state.status == AppStatus.initial) {
            bloc.add(const LoadTransactionsEvent());
          }
          return switch (state.status) {
            AppStatus.success => _buildSuccessPage(
                context,
                transactions: state.transactions,
              ),
            (_) => const SizedBox(),
          };
        },
      ),
    );
  }

  _buildSuccessPage(
    BuildContext context, {
    required List<Transaction> transactions,
  }) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No data to be shown.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    } else {
      return TransactionsListWidget(
        transactions: transactions,
      );
    }
  }
}
