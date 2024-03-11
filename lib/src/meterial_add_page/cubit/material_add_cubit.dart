// Define the cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';

class MaterialAddCubit extends Cubit<TextState> {
  MaterialAddCubit() : super(TextState(text: '', isVisible: true, number: 0));

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
