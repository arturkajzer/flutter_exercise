import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:warehouse/src/navigation/app_page.dart';

class MaterialListPage extends AppPage {
  MaterialListPage()
      : super(
          builder: (context) => const _MaterialListPageView(),
        );
}

class _MaterialListPageView extends HookWidget {
  const _MaterialListPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Welcome'),
      ),
      body: const Center(child: Text('LIST PAGE')),
    );
  }
}
