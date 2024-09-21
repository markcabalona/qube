class QubeRegex {
  const QubeRegex._();

  static final emailAddressRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final phoneNumberRegex = RegExp(r'^(9|09|\+639|639)[0-9]{9}$');
}
