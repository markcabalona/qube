import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:qube/core/router/routes/qube_routes.dart';
import 'package:qube/core/router/routes/transactions_routes.dart';
import 'package:qube/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:qube/features/transactions/presentation/cubit/transaction_step_cubit.dart';
import 'package:qube/features/transactions/presentation/pages/qube_home_page.dart';

class QubeRouter {
  const QubeRouter._();
  static final GoRouteInformationParser routeInformationParser =
      _router.routeInformationParser;

  static final GoRouteInformationProvider routeInformationProvider =
      _router.routeInformationProvider;

  static final GoRouterDelegate routerDelegate = _router.routerDelegate;

  static final _router = GoRouter(
    initialLocation: QubeRoutes.transactions.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.instance<TransactionsBloc>(),
            ),
            BlocProvider(
              create: (context) => GetIt.instance<TransactionStepCubit>(),
            ),
          ],
          child: QubeHomePage(
            child: child,
          ),
        ),
        routes: [
          ShellRoute(
            routes: TransactionsRoutes.routes,
            builder: (context, state, child) => child,
          ),
        ],
      ),
    ],
  );

  static void go<T>(
    QubeRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.goNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void push<T>(
    QubeRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.pushNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void replace<T>(
    QubeRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.replaceNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void pushReplacement<T>(
    QubeRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.pushReplacementNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }
}
