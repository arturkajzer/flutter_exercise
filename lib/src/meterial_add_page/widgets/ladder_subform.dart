import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/material_add_form_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_page_cubit.dart';
import 'package:warehouse/src/meterial_add_page/models/ladder_model.dart';

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
        Row(
          children: [
            Expanded(
              child: MaterialButton(
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
            ),
          ],
        ),
      ],
    );
  }
}
