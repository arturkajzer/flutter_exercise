import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(MaterialAddState(
            selectedCategory: null,
            helmetModel: HelmetModel(name: '', quantity: ''),
            helmetIsVisible: true,
            ladderIsVisible: false,
            scaffoldPartIsVisible: false,
            number: 0));

  final MaterialRepository materialRepository;

  void updateText(String newText) {
    emit(MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: HelmetModel(name: newText, quantity: ''),
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: false,
        scaffoldPartIsVisible: false,
        number: state.number));
  }

  void toggleVisibility(MaterialCategory? selectedCategory) {
    emit(MaterialAddState(
        selectedCategory: selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: selectedCategory == MaterialCategory.helmet,
        ladderIsVisible: selectedCategory == MaterialCategory.ladder,
        scaffoldPartIsVisible:
            selectedCategory == MaterialCategory.scaffoldPart,
        number: state.number));
  }

  void increment() {
    emit(MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: state.ladderIsVisible,
        scaffoldPartIsVisible: state.scaffoldPartIsVisible,
        number: state.number + 1));
  }

  void decrement() {
    emit(
      MaterialAddState(
        selectedCategory: state.selectedCategory,
        helmetModel: state.helmetModel,
        helmetIsVisible: state.helmetIsVisible,
        ladderIsVisible: state.ladderIsVisible,
        scaffoldPartIsVisible: state.scaffoldPartIsVisible,
        number: state.number - 1,
      ),
    );
  }

  Future<void> submitHelmetData() async {
    // if (state is! ShowDataState) {
    //   return;
    // }

    // final currentState = state as ShowDataState;
    // final data = currentState.materialAddData;
    // final newData = data.copyWith();

    // emit(DataSavingState(materialAddData: newData));
    
    await materialRepository.addHelmetItem('test', 1);
    // emit(DataSavedState(materialAddData: newData));
  }
}
