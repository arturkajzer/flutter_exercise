import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

GoRouter createGoRouter(
  BuildContext context, {
  GlobalKey<NavigatorState>? navigatorKey,
}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: $appRoutes,
    initialLocation: MaterialListRoute().location,
  );
}
