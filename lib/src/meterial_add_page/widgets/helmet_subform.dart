import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/material_add_form_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_page_cubit.dart';
import 'package:warehouse/src/meterial_add_page/models/helmet_model.dart';
import 'package:warehouse/src/meterial_add_page/widgets/form_fields/form_increment_decrement_field.dart';
import 'package:warehouse/src/meterial_add_page/widgets/form_fields/form_text_field.dart';

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
        FormTextField(
          field: helmetNameCubit,
          errorTranslator: (errorMessage) {
            return errorMessage;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Quantity:'),
        FormIncrementDecrementField(
          field: helmetQuantityCubit,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: MaterialButton(
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
            ),
          ],
        ),
      ],
    );
  }
}
