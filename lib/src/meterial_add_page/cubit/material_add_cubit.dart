import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit()
      : super(MaterialAddState(
            selectedCategory: null,
            helmetModel: HelmetModel(name: '', quantity: ''),
            helmetIsVisible: true,
            ladderIsVisible: false,
            number: 0));

  void updateText(String newText) {
    emit(MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: HelmetModel(name: newText, quantity: ''),
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: false,
        number: state.number));
  }

  void toggleVisibility(MaterialCategory? selectedCategory) {
    final bool isHelmetVisible;
    final bool isLadderVisible;
    final bool isScaffoldPartVisible;

    switch (selectedCategory) {
      case null:
        isHelmetVisible = false;
        isLadderVisible = false;
        isScaffoldPartVisible = false;
      case MaterialCategory.helmet:
        isHelmetVisible = true;
        isLadderVisible = false;
        isScaffoldPartVisible = false;
      case MaterialCategory.ladder:
        isHelmetVisible = false;
        isLadderVisible = true;
        isScaffoldPartVisible = false;
      case MaterialCategory.scaffoldPart:
        isHelmetVisible = false;
        isLadderVisible = false;
        isScaffoldPartVisible = true;
    }

    emit(MaterialAddState(
        selectedCategory: selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: isHelmetVisible,
        ladderIsVisible: isLadderVisible,
        number: state.number));
  }

  void increment() {
    emit(MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: state.ladderIsVisible,
        number: state.number + 1));
  }

  void decrement() {
    emit(
      MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: state.ladderIsVisible,
        number: state.number - 1,
      ),
    );
  }
}
