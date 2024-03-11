import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
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
      create: (context) => TextCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Cubit Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TextCubit, TextState>(
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
                              context.read<TextCubit>().updateText(value);
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
                                  context.read<TextCubit>().decrement();
                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(width: 10),
                              Text('${state.number}'),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<TextCubit>().increment();
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
                        context.read<TextCubit>().toggleVisibility();
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
class TextState {
  final String text;
  final bool isVisible;
  final int number;

  TextState(
      {required this.text, required this.isVisible, required this.number});
}

// Define the cubit
class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextState(text: '', isVisible: true, number: 0));

  // Update text value
  void updateText(String newText) {
    emit(TextState(
        text: newText, isVisible: state.isVisible, number: state.number));
  }

  // Toggle visibility of the text field
  void toggleVisibility() {
    emit(TextState(
        text: state.text, isVisible: !state.isVisible, number: state.number));
  }

  // Increment number
  void increment() {
    emit(TextState(
        text: state.text,
        isVisible: state.isVisible,
        number: state.number + 1));
  }

  // Decrement number
  void decrement() {
    emit(TextState(
        text: state.text,
        isVisible: state.isVisible,
        number: state.number - 1));
  }
}
