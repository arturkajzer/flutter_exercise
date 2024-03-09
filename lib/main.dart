import 'package:cqrs/cqrs.dart';
import 'package:flutter/material.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/data/mock.dart';
import 'package:warehouse/src/navigation/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Cqrs>(create: (_) => createCqrs()),
        Provider<MaterialRepository>(
          create: (context) => MaterialRepository(
            cqrs: context.read(),
          ),
        ),
      ],
      child: RequestLayoutConfigProvider(
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onError: (context, error, onErrorCallback) => const Text('Error'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = useMemoized(GlobalKey<NavigatorState>.new);
    final router = useMemoized(
      () => createGoRouter(
        context,
        navigatorKey: globalKey,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Exercise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
