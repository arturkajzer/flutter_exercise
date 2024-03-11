import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/navigation/app_page.dart';

import 'cubit/models/helmet_model.dart';
import 'cubit/models/ladder_model.dart';

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
    final materialAddCubit = useBloc(
      () => MaterialAddCubit(
        materialRepository: context.read(),
      ),
    );

    final helmetNameEditingController = useTextEditingController();
    final ladderNameEditingController = useTextEditingController();
    final ladderLoadCapacityEditingController = useTextEditingController();
    final ladderMaximumHeightEditingController = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Center(
          child: Text('Add material'),
        ),
      ),
      body: BlocBuilder<MaterialAddCubit, MaterialAddState>(
        bloc: materialAddCubit,
        builder: (context, state) {
          helmetNameEditingController.text = state.data.helmetModel.name;
          ladderNameEditingController.text = state.data.ladderModel.name;

          return Padding(
            padding: const EdgeInsets.all(10),
            child: LoadingOverlay(
              isLoading: state is DataIsSaving,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Select the category and complete the form to add a new item to the warehouse',
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButton<MaterialCategory>(
                        hint: const Text('Please, select item'),
                        value: state.data.selectedCategory,
                        onChanged: materialAddCubit.toggleVisibility,
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
                      const SizedBox(height: 20),
                      Visibility(
                        visible: state.data.helmetIsVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Name:'),
                            TextFormField(
                              controller: helmetNameEditingController,
                              onChanged: materialAddCubit.updateHelmetName,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Name is required ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text('Quantity:'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: materialAddCubit.decrement,
                                ),
                                const SizedBox(width: 10),
                                Text('${state.data.helmetModel.quantity}'),
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: materialAddCubit.increment,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: MaterialButton(
                                color: Theme.of(context).colorScheme.primary,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await materialAddCubit.submitHelmetData(
                                      HelmetModel(
                                        name: state.data.helmetModel.name,
                                        quantity:
                                            state.data.helmetModel.quantity,
                                      ),
                                    );
                                    context.pop<bool>(true);
                                  }
                                },
                                child: const Text(
                                  'Add helmet',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: state.data.ladderIsVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Name:'),
                            TextFormField(
                              controller: ladderNameEditingController,
                              onChanged: materialAddCubit.updateLadderName,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Name is required ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text('Maximum working height:'),
                            TextFormField(
                              controller: ladderMaximumHeightEditingController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                materialAddCubit.updateLadderMaximumHeight(
                                    int.parse(value));
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Maximum working height is required ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text('Ladder load capacity:'),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: ladderLoadCapacityEditingController,
                              onChanged: (value) {
                                materialAddCubit
                                    .updateLadderLoadCapacity(int.parse(value));
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Ladder load capacity is required ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: MaterialButton(
                                color: Theme.of(context).colorScheme.primary,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await materialAddCubit.submitLadderData(
                                      LadderModel(
                                        name: state.data.ladderModel.name,
                                        ladderLoadCapacityInKg: state.data
                                            .ladderModel.ladderLoadCapacityInKg,
                                        maximumWorkingHeightInCm: state
                                            .data
                                            .ladderModel
                                            .maximumWorkingHeightInCm,
                                      ),
                                    );
                                    context.pop<bool>(true);
                                  }
                                },
                                child: const Text(
                                  'Add ladder',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: state.data.scaffoldPartIsVisible,
                        child: const Column(
                          children: [
                            Text('SCAFFOLD PART'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
