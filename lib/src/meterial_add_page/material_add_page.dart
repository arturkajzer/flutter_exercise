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

    final nameEditingController = useTextEditingController();
    final ladderEditingController = useTextEditingController();

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
          nameEditingController.text = state.helmetModel.name;
          ladderEditingController.text = 'test ladder';

          return Padding(
            padding: const EdgeInsets.all(10),
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
                    children: [
                      TextField(
                        controller: nameEditingController,
                        onChanged: materialAddCubit.updateText,
                        decoration:
                            const InputDecoration(labelText: 'Enter Text'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: materialAddCubit.decrement,
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 10),
                          Text('${state.number}'),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: materialAddCubit.increment,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      MaterialButton(
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () async {
                          await materialAddCubit.submitHelmetData();
                          context.pop<bool>(true);
                        },
                        child: const Text(
                          'Add helmet',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.ladderIsVisible,
                  child: const Column(
                    children: [
                      Text('LADDER'),
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
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   _nameEditingController.dispose();
  //   _ladderEditingController.dispose();
  // }
}

// Define the state for the cubit


