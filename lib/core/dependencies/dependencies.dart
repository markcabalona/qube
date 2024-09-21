import 'package:qube/core/dependencies/theme.dart';
import 'package:qube/core/dependencies/transactions_blocs.dart';

Future<void> initializeDependencies() async {
  initializeTheme();
  initializeTransactionsBlocs();
}
