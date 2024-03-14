import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:warehouse/src/meterial_add_page/models/icon_label.dart';
import 'package:warehouse/src/navigation/app_page.dart';
import 'cubit/form_cubits/material_add_form_cubit.dart';
import 'cubit/material_add_page_cubit.dart';
import 'widgets/helmet_subform.dart';
import 'widgets/ladder_subform.dart';
import 'widgets/scaffold_part_subform.dart';

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
                padding: const EdgeInsets.all(10),
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
                        const SizedBox(height: 20),
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
