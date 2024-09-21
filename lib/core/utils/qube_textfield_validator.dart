import 'package:qube/core/utils/qube_regex.dart';

class QubeTextfieldValidator {
  const QubeTextfieldValidator._();

  static String? nonEmptyValidator(
    String? value, {
    String errorMessage = 'Field can not be empty.',
  }) {
    final isValid = value != null && value.isNotEmpty;
    return isValid ? null : errorMessage;
  }

  static String? validateEmail(String? value) {
    final isValid = QubeRegex.emailAddressRegex.hasMatch(value ?? '');
    return isValid ? null : 'Invalid email format';
  }

  static String? validatePhoneNumber(String? value) {
    final isValid = QubeRegex.phoneNumberRegex.hasMatch(value ?? '');
    return isValid ? null : 'Invalid mobile phone format';
  }
}
