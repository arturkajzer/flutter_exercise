import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/meterial_add_page/widgets/helmet_form/helmet_form.dart';
import 'package:warehouse/src/meterial_add_page/widgets/ladder_form/ladder_form.dart';
import 'package:warehouse/src/meterial_add_page/widgets/scaffold_part_form/scaffold_part_form.dart';
import 'package:warehouse/src/navigation/app_page.dart';

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
    // final materialAddCubit = useBloc(MaterialAddCubit.new);
    final materialAddCubit = context.read<MaterialAddCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Center(
          child: Text('Add material'),
        ),
      ),
      body: BlocBuilder<MaterialAddCubit, IconLabel?>(
        builder: (context, selectedOption) {
          return Padding(
            padding: const EdgeInsets.all(10),
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
                  DropdownButton<IconLabel>(
                    hint: const Text('Please, select item'),
                    value: selectedOption,
                    onChanged: materialAddCubit.selectForm,
                    items: IconLabel.values.map((iconLabel) {
                      return DropdownMenuItem<IconLabel>(
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
                        switch (selectedOption) {
                          null => Container(),
                          IconLabel.helmet => const HelmetForm(),
                          IconLabel.ladder => const LadderForm(),
                          IconLabel.scaffoldPart => const ScaffoldPartForm(),
                        },
              
                        // if (selectedOption == IconLabel.helmet)
                        //   HelmetForm()
                        // else
                        //   Placeholder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
