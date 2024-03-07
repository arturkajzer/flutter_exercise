import 'package:flutter/material.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/src/meterial_list_page/cubit/material_list_cubit.dart';
import 'package:warehouse/src/meterial_list_page/widgets/material_list_item.dart';
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
    final materialListCubit = useBloc(
      () => MaterialListCubit(
        materialRepository: context.read(),
      )..run(),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Center(
          child: Text('Materials'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
              // onInitial: (context) => Center(
              //   child: ElevatedButton(
              //     onPressed: context.read<ProjectDetailsCubit>().run,
              //     child: const AppText('Fetch the data'),
              //   ),
              // ),
              onLoading: (context) =>
                  const Center(child: CircularProgressIndicator()),
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
