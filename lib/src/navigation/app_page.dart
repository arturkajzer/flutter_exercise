import 'package:flutter/widgets.dart';
import 'package:warehouse/src/navigation/routes.dart';

abstract class AppPage extends Page<void> {
  const AppPage({
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Route<void> createRoute(BuildContext context) => AppRoute(
        settings: this,
        builder: builder,
      );
}
