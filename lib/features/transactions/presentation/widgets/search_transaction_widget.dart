import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qube/core/enums/transaction_step.dart';
import 'package:qube/core/utils/debounce.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';

class SearchTransactionWidget extends StatefulWidget {
  const SearchTransactionWidget({
    super.key,
  });

  @override
  State<SearchTransactionWidget> createState() =>
      _SearchTransactionWidgetState();
}

class _SearchTransactionWidgetState extends State<SearchTransactionWidget> {
  final debounce = Debounce();
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionStepCubit, TransactionStep>(
      buildWhen: (previous, current) {
        controller.clear();
        debounce.cancel();
        return previous != current;
      },
      builder: (context, state) {
        return TextField(
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            debounce.run(() {
              GetIt.instance<TransactionsBloc>(
                instanceName: state.name,
              ).add(
                SearchTransactionsEvent(
                  searchParam: value,
                ),
              );
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            hintText: 'Location or Transaction Number',
            contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
            prefixIcon: const Icon(Icons.search),
          ),
        );
      },
    );
  }
}
