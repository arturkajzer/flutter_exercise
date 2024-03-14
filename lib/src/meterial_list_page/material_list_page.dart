import 'package:flutter/material.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/src/meterial_list_page/cubit/material_list_cubit.dart';
import 'package:warehouse/src/meterial_list_page/widgets/material_list_item.dart';
import 'package:warehouse/src/navigation/app_page.dart';
import 'package:warehouse/src/navigation/routes.dart';

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
    final materialListCubit = useBloc(
      () => MaterialListCubit(
        materialRepository: context.read(),
      )..run(),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text('Materials'),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await MaterialAddRoute().push<bool>(context);
              if (result != null && result) {
                await materialListCubit.run();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RequestCubitBuilder(
              cubit: materialListCubit,
              onError: (context, error, retry) => Center(
                child: ElevatedButton(
                  onPressed: retry,
                  child: const Text('Retry'),
                ),
              ),
              builder: (context, data) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return MaterialListItemView(
                      item: item,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
