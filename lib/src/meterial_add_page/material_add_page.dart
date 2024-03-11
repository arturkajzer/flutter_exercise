import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/navigation/app_page.dart';

class MaterialAddPage extends AppPage {
  MaterialAddPage()
      : super(
          builder: (context) => _MaterialAddPageView(),
        );
}

class _MaterialAddPageView extends HookWidget {
  _MaterialAddPageView();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaterialAddCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Cubit Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<MaterialAddCubit, TextState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Visibility(
                      visible: state.isVisible,
                      child: Column(
                        children: [
                          TextField(
                            controller: _textEditingController,
                            onChanged: (value) {
                              context
                                  .read<MaterialAddCubit>()
                                  .updateText(value);
                            },
                            decoration:
                                InputDecoration(labelText: 'Enter Text'),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<MaterialAddCubit>().decrement();
                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(width: 10),
                              Text('${state.number}'),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<MaterialAddCubit>().increment();
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButton<String>(
                      value: state.isVisible ? 'Visible' : 'Hidden',
                      onChanged: (newValue) {
                        context.read<MaterialAddCubit>().toggleVisibility();
                      },
                      items: <String>['Visible', 'Hidden']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
  }
}

// Define the state for the cubit


