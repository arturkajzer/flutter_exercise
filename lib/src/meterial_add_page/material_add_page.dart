import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/meterial_add_page/widgets/helmet_form/helmet_form.dart';
import 'package:warehouse/src/meterial_add_page/widgets/ladder_form/ladder_form.dart';
import 'package:warehouse/src/meterial_add_page/widgets/scaffold_part_form/scaffold_part_form.dart';
import 'package:warehouse/src/navigation/app_page.dart';
import 'package:warehouse/src/navigation/routes.dart';

class MaterialAddPage extends AppPage {
  MaterialAddPage()
      : super(
          builder: (context) => const _MaterialAddPageView(),
        );
}

class _MaterialAddPageView extends HookWidget {
  const _MaterialAddPageView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaterialAddCubit(
        materialListCubit: context.read(),
        materialRepository: context.read(),
      )..pageInit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Center(
            child: Text('Add material'),
          ),
        ),
        body: BlocListener<MaterialAddCubit, MaterialAddState>(
          listener: (context, state) {
            if (state is DataSavedState) {
              MaterialListRoute().go(context);
            }
          },
          child: BlocBuilder<MaterialAddCubit, MaterialAddState>(
            builder: (context, state) {
              final materialAddCubit = context.read<MaterialAddCubit>();
              final selectedCategory = state.selectedCategory;

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    LoadingOverlay(
                      isLoading: state is DataSavingState,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Select the category and complete the form to add a new item to the warehouse',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Category: '),
                            DropdownButton<MaterialCategory>(
                              hint: const Text('Please, select item'),
                              value: selectedCategory,
                              onChanged: materialAddCubit.selectForm,
                              items: MaterialCategory.values.map((iconLabel) {
                                return DropdownMenuItem<MaterialCategory>(
                                  value: iconLabel,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(iconLabel.icon),
                                      const SizedBox(width: 10),
                                      Text(iconLabel.label),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  switch (selectedCategory) {
                                    MaterialCategory.helmet =>
                                      const HelmetForm(),
                                    MaterialCategory.ladder =>
                                      const LadderForm(),
                                    MaterialCategory.scaffoldPart =>
                                      const ScaffoldPartForm(),
                                    null => Container(),
                                  },
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
