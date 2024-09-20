import 'package:get_it/get_it.dart';
import 'package:qube/core/theme/qube_theme.dart';

void initializeTheme() {
  GetIt.instance.registerLazySingleton(
    () => QubeTheme(),
  );
}
