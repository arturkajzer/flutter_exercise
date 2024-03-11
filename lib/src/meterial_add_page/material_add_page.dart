import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  _MaterialAddPageView();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _ladderEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaterialAddCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Center(
            child: Text('Add material'),
          ),
        ),
        body: BlocBuilder<MaterialAddCubit, MaterialAddState>(
          builder: (context, state) {
          _nameEditingController.text = state.helmetModel.name;
          _ladderEditingController.text = 'test ladder';

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
                    onChanged: (newValue) {
                      context
                          .read<MaterialAddCubit>()
                          .toggleVisibility(newValue);
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
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: state.helmetIsVisible,
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameEditingController,
                          onChanged: (value) {
                            context.read<MaterialAddCubit>().updateText(value);
                          },
                          decoration:
                              const InputDecoration(labelText: 'Enter Text'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<MaterialAddCubit>().decrement();
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 10),
                            Text('${state.number}'),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                context.read<MaterialAddCubit>().increment();
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        MaterialButton(
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () async {
                            //save
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
                    child: Column(
                      children: [
                        TextField(
                          controller: _ladderEditingController,
                          onChanged: (value) {
                            context.read<MaterialAddCubit>().updateText(value);
                          },
                          decoration:
                              const InputDecoration(labelText: 'LADDER'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<MaterialAddCubit>().decrement();
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 10),
                            Text('${state.number}'),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                context.read<MaterialAddCubit>().increment();
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _ladderEditingController.dispose();
  }
}

// Define the state for the cubit


