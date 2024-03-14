import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/scaffold_part_model.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/navigation/app_page.dart';
import 'cubit/material_add_form_cubit.dart';
import 'cubit/material_add_page_cubit.dart';
import 'cubit/models/helmet_model.dart';
import 'cubit/models/ladder_model.dart';

class MaterialAddPage extends AppPage {
  MaterialAddPage()
      : super(
          builder: (context) => const MaterialAddForm(),
        );
}

class MaterialAddForm extends StatelessWidget {
  const MaterialAddForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialAddPageCubit(
            materialRepository: context.read(),
          ),
        ),
        BlocProvider<MaterialAddFormCubit>(
          create: (context) => MaterialAddFormCubit(),
        ),
      ],
      child: const _MaterialAddPageView(),
    );
  }
}

class _MaterialAddPageView extends HookWidget {
  const _MaterialAddPageView();

  @override
  Widget build(BuildContext context) {
    final pageCubit = context.read<MaterialAddPageCubit>();
    final formCubit = context.read<MaterialAddFormCubit>();

    final categoryDropDownCubit =
        context.read<MaterialAddFormCubit>().categoryDropDown;

    return BlocBuilder<MaterialAddPageCubit, bool>(
      builder: (context, state) {
        return BlocBuilder<MaterialAddFormCubit, FormGroupState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                forceMaterialTransparency: true,
                title: const Center(
                  child: Text('Add material'),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: LoadingOverlay(
                  isLoading: pageCubit.state,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Select the category and complete the form to add a new item to the warehouse',
                          ),
                        ),
                        const SizedBox(height: 20),
                        FieldBuilder(
                          field: categoryDropDownCubit,
                          builder: (context, state) {
                            return DropdownButton<MaterialCategory>(
                              hint: const Text('Please, select item'),
                              value: state.value,
                              onChanged: (value) {
                                categoryDropDownCubit.setValue(value);
                                switch (value) {
                                  case null:
                                    formCubit.showLadderSubForm();
                                  case MaterialCategory.helmet:
                                    formCubit.showHelmetSubForm();
                                  case MaterialCategory.ladder:
                                    formCubit.showLadderSubForm();
                                  case MaterialCategory.scaffoldPart:
                                    formCubit.showScaffoldPartSubForm();
                                }
                                return;
                              },
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
                            );
                          },
                        ),
                        switch (categoryDropDownCubit.state.value) {
                          null => Container(),
                          MaterialCategory.helmet => const HelmetSubform(),
                          MaterialCategory.ladder => const LadderSubform(),
                          MaterialCategory.scaffoldPart =>
                            const ScaffoldPartSubform(),
                        },
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class HelmetSubform extends StatelessWidget {
  const HelmetSubform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<MaterialAddFormCubit>();
    final pageCubit = context.read<MaterialAddPageCubit>();

    final helmetNameCubit =
        context.read<MaterialAddFormCubit>().helmetSubForm.helmetName;
    final helmetQuantityCubit =
        context.read<MaterialAddFormCubit>().helmetSubForm.helmetQuantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name:'),
        FieldBuilder(
          field: helmetNameCubit,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              onChanged: helmetNameCubit.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Quantity:'),
        FieldBuilder(
          field: helmetQuantityCubit,
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: helmetQuantityCubit.decrement,
                ),
                const SizedBox(width: 10),
                Text('${helmetQuantityCubit.state.value}'),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: helmetQuantityCubit.increment,
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          color: Theme.of(context).colorScheme.primary,
          onPressed: () async {
            if (formCubit.validate()) {
              await pageCubit
                  .submitHelmetData(
                    HelmetModel(
                      name: helmetNameCubit.state.value,
                      quantity: helmetQuantityCubit.state.value,
                    ),
                  )
                  .then((result) => context.pop<bool>(true));
            }
          },
          child: const Text(
            'Add helmet',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class LadderSubform extends StatelessWidget {
  const LadderSubform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<MaterialAddFormCubit>();
    final pageCubit = context.read<MaterialAddPageCubit>();

    final ladderNameCubit =
        context.read<MaterialAddFormCubit>().ladderSubForm.ladderName;

    final ladderMaximumHeightCubit =
        context.read<MaterialAddFormCubit>().ladderSubForm.ladderMaximumHeight;

    final ladderLoadCapacity =
        context.read<MaterialAddFormCubit>().ladderSubForm.ladderLoadCapacity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name:'),
        FieldBuilder(
          field: ladderNameCubit,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              onChanged: ladderNameCubit.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Maximum working height:'),
        FieldBuilder(
          field: ladderMaximumHeightCubit,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              onChanged: ladderMaximumHeightCubit.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Ladder load capacity:'),
        FieldBuilder(
          field: ladderLoadCapacity,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              onChanged: ladderLoadCapacity.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          color: Theme.of(context).colorScheme.primary,
          onPressed: () async {
            if (formCubit.validate()) {
              await pageCubit
                  .submitLadderData(
                    LadderModel(
                      name: ladderNameCubit.state.value,
                      maximumWorkingHeightInCm:
                          int.parse(ladderMaximumHeightCubit.state.value),
                      ladderLoadCapacityInKg:
                          int.parse(ladderNameCubit.state.value),
                    ),
                  )
                  .then((result) => context.pop<bool>(true));
            }
          },
          child: const Text(
            'Add ladder',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ScaffoldPartSubform extends StatelessWidget {
  const ScaffoldPartSubform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<MaterialAddFormCubit>();
    final pageCubit = context.read<MaterialAddPageCubit>();

    final scaffoldPartNameCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartName;
    final scaffoldPartQuantityCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartQuantity;
    final scaffoldPartImageCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartImage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name:'),
        FieldBuilder(
          field: scaffoldPartNameCubit,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              onChanged: scaffoldPartNameCubit.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Quantity:'),
        FieldBuilder(
          field: scaffoldPartQuantityCubit,
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: scaffoldPartQuantityCubit.decrement,
                ),
                const SizedBox(width: 10),
                Text('${scaffoldPartQuantityCubit.state.value}'),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: scaffoldPartQuantityCubit.increment,
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FieldBuilder(
          field: scaffoldPartImageCubit,
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                final imageBytes = await _pickImageFromGallery();
                scaffoldPartImageCubit.setValue(imageBytes);
              },
              child: scaffoldPartImageCubit.state.value.isNotEmpty
                  ? Image.memory(
                      Uint8List.fromList(scaffoldPartImageCubit.state.value),
                      width: 200,
                      height: 200,
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          color: Theme.of(context).colorScheme.primary,
          onPressed: () async {
            if (formCubit.validate()) {
              await pageCubit
                  .submitScaffoldPartData(
                    ScaffoldPartModel(
                      name: scaffoldPartNameCubit.state.value,
                      quantity: scaffoldPartQuantityCubit.state.value,
                      imageBytes: scaffoldPartImageCubit.state.value,
                    ),
                  )
                  .then((result) => context.pop<bool>(true));
            }
          },
          child: const Text(
            'Add scaffold part',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<List<int>> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      return bytes;
    } else {
      return [];
    }
  }
}
