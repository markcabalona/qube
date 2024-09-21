import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qube/core/enums/transaction_step.dart';
import 'package:qube/core/router/qube_router.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';
import 'package:qube/core/widgets/qube_stepper_widget.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';
import 'package:qube/features/transactions/presentation/widgets/search_transaction_widget.dart';

class QubeHomePage extends StatelessWidget {
  const QubeHomePage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GradientWrapper(
          child: Icon(
            Icons.abc,
            size: 60,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _onPressedProfile,
            icon: CircleAvatar(
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              foregroundColor: Theme.of(context).colorScheme.inverseSurface,
              child: const Icon(
                Icons.person_outline,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            const SearchTransactionWidget(),
            const SizedBox(height: 12),
            _buildStepperWidget(),
            const SizedBox(height: 12),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  BlocConsumer<TransactionStepCubit, TransactionStep> _buildStepperWidget() {
    return BlocConsumer<TransactionStepCubit, TransactionStep>(
      bloc: GetIt.instance(),
      listener: (context, state) {
        switch (state) {
          case TransactionStep.stepOne:
            QubeRouter.go(QubeRoutes.transactions);
            break;
          case TransactionStep.stepTwo:
            QubeRouter.go(QubeRoutes.deliveryDetails);
            break;
          default:
        }
      },
      builder: (context, state) {
        return QubeStepperWidget(
          index: state.value,
          children: TransactionStep.values
              .map(
                (step) => GestureDetector(
                  onTap: () {
                    GetIt.instance<TransactionStepCubit>().goToStep(step);
                  },
                  child: Text(
                    'Step ${step.value + 1}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  void _onPressedProfile() {}
}
