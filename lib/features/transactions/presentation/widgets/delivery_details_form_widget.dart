import 'package:flutter/material.dart';
import 'package:qube/core/extensions/date_time_extension.dart';
import 'package:qube/core/utils/qube_textfield_validator.dart';
import 'package:qube/core/widgets/gradient_wrapper.dart';
import 'package:qube/core/widgets/qube_text_form_field.dart';
import 'package:qube/features/transactions/domain/entities/transaction.dart';

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
  const _DetailsForm({
    super.key,
  });

  @override
  State<_DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<_DetailsForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          QubeTextFormField(
            hintText: 'Enter name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (key) => QubeTextfieldValidator.nonEmptyValidator(
              key,
              errorMessage: 'Enter name',
            ),
          ),
          const QubeTextFormField(
            hintText: 'Enter e-mail',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: QubeTextfieldValidator.validateEmail,
          ),
          const QubeTextFormField(
            hintText: 'Enter phone number',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: QubeTextfieldValidator.validatePhoneNumber,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _onTapDeliver,
              child: const GradientWrapper(
                child: Text(
                  'Deliver',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapDeliver() {
    if (formKey.currentState?.validate() == true) {
      // TODO: Trigger deliver action
    }
  }
}
