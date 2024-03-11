import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/navigation/app_page.dart';

class MaterialAddPage extends AppPage {
  MaterialAddPage()
      : super(
          builder: (context) => _MaterialAddPageView(),
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
          helmetNameEditingController.text = state.helmetModel.name;
          ladderNameEditingController.text = state.ladderModel.name;

          return Padding(
            padding: const EdgeInsets.all(10),
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
                      value: state.selectedCategory,
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
                      visible: state.helmetIsVisible,
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
                              ElevatedButton(
                                onPressed: materialAddCubit.decrement,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 10),
                              Text('${state.helmetModel.quantity}'),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: materialAddCubit.increment,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: MaterialButton(
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () async {
                                await materialAddCubit.submitHelmetData(
                                  HelmetModel(
                                    name: state.helmetModel.name,
                                    quantity: state.helmetModel.quantity,
                                  ),
                                );
                                context.pop<bool>(true);
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
                      visible: state.ladderIsVisible,
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
                                      name: state.ladderModel.name,
                                      ladderLoadCapacityInKg: 0,
                                      maximumWorkingHeightInCm: 0
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
                      visible: state.scaffoldPartIsVisible,
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
          );
        },
      ),
    );
  }
}
