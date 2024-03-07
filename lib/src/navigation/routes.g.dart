// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
    ];

RouteBase get $rootRoute => ShellRouteData.$route(
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/welcome',
          factory: $MaterialListRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'material_add',
              factory: $MaterialAddRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute();
}

extension $MaterialListRouteExtension on MaterialListRoute {
  static MaterialListRoute _fromState(GoRouterState state) =>
      MaterialListRoute();

  String get location => GoRouteData.$location(
        '/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MaterialAddRouteExtension on MaterialAddRoute {
  static MaterialAddRoute _fromState(GoRouterState state) => MaterialAddRoute();

  String get location => GoRouteData.$location(
        '/welcome/material_add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
