import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse/src/meterial_add_page/material_add.dart';
import 'package:warehouse/src/meterial_list_page/material_list.dart';

part 'routes.g.dart';

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<MaterialListRoute>(
      path: '/welcome',
      routes: [
        TypedGoRoute<MaterialAddRoute>(path: 'material_add'),
      ],
    ),
  ],
)

class RootRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}


class AppRoute extends MaterialPageRoute<void> {
  AppRoute({
    required super.builder,
    required super.settings,
  });
}

class MaterialListRoute extends GoRouteData {
  MaterialListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialListPage();
}

class MaterialAddRoute extends GoRouteData {
  MaterialAddRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialAddPage();
}



