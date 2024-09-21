import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube/core/enums/app_status.dart';
import 'package:qube/core/extensions/date_time_extension.dart';
import 'package:qube/core/router/qube_router.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/core/utils/qube_textfield_validator.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';
import 'package:qube/core/widgets/qube_text_form_field.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';
import 'package:qube/features/transactions/presentation/cubit/delivery_details_form_cubit.dart';

class DeliveryDetailsFormWidget extends StatelessWidget {
  const DeliveryDetailsFormWidget({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final labelSmall = themeData.textTheme.labelSmall?.copyWith(
      color: themeData.colorScheme.onSurface.withOpacity(.5),
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.createdAt.toFormattedString('hh:mm aa'),
              style: labelSmall,
            ),
            const Text(
              'Enter Details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const _DetailsForm(),
          ],
        ),
      ),
    );
  }
}

class _DetailsForm extends StatefulWidget {
  const _DetailsForm();

  @override
  State<_DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<_DetailsForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DeliveryDetailsFormCubit>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          QubeTextFormField(
            hintText: 'Enter name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              cubit.updateForm(
                name: value,
              );
            },
            validator: (key) => QubeTextfieldValidator.nonEmptyValidator(
              key,
              errorMessage: 'Enter name',
            ),
          ),
          QubeTextFormField(
            hintText: 'Enter e-mail',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: QubeTextfieldValidator.validateEmail,
            onChanged: (value) {
              cubit.updateForm(
                email: value,
              );
            },
          ),
          QubeTextFormField(
            hintText: 'Enter phone number',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: QubeTextfieldValidator.validatePhoneNumber,
            onChanged: (value) {
              cubit.updateForm(
                phone: value,
              );
            },
          ),
          const SizedBox(height: 10),
          _DeliverButton(
            onTapDeliver: () {
              _onTapDeliver(cubit);
            },
          ),
        ],
      ),
    );
  }

  void _onTapDeliver(DeliveryDetailsFormCubit cubit) {
    if (formKey.currentState?.validate() == true) {
      cubit.submitForm();
    }
  }
}

class _DeliverButton extends StatelessWidget {
  const _DeliverButton({
    required this.onTapDeliver,
  });
  final VoidCallback onTapDeliver;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
        DeliveryDetailsFormCubit,
        DeliveryDetailsFormState,
        ({
          bool isEnabled,
          bool isSuccesful,
          String text,
        })>(
      selector: (state) {
        final isLoading = AppStatus.loading == state.status;
        final isSuccesful = AppStatus.success == state.status;

        final fieldHasEmpty =
            state.name.isEmpty || state.email.isEmpty || state.phone.isEmpty;
        final isEnabled = !(isLoading || fieldHasEmpty);
        final text = switch (state.status) {
          AppStatus.initial => 'Deliver',
          AppStatus.loading => 'Posting',
          AppStatus.success => 'Posted!',
          (_) => 'Ok',
        };

        if (isSuccesful) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            Future.delayed(
              const Duration(seconds: 1),
              () => QubeRouter.go(QubeRoutes.transactions),
            );
          });
        }
        return (
          isEnabled: isEnabled,
          isSuccesful: isSuccesful,
          text: text,
        );
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed:
                state.isEnabled && !state.isSuccesful ? onTapDeliver : null,
            style: FilledButton.styleFrom(
              disabledForegroundColor: Colors.white,
            ),
            child: state.isEnabled || state.isSuccesful
                ? GradientWrapper(
                    child: Text(
                    state.text,
                  ))
                : Text(state.text),
          ),
        );
      },
    );
  }
}
