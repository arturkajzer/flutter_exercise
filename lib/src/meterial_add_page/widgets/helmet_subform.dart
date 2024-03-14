import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/material_add_form_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_page_cubit.dart';
import 'package:warehouse/src/meterial_add_page/models/helmet_model.dart';

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
              textInputAction: TextInputAction.next,
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
