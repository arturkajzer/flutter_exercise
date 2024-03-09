import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(const ShowDataState(selectedCategory: null));
  final MaterialRepository materialRepository;

  void pageInit() => emit(
        const ShowDataState(selectedCategory: null),
      );

  void selectForm(MaterialCategory? selectedCategory) => emit(
        ShowDataState(selectedCategory: selectedCategory),
      );

  Future<void> submitData() async {
    if (state is! ShowDataState) {
      return;
    }

    final currentState = state as ShowDataState;

    emit(DataSavingState(selectedCategory: currentState.selectedCategory));
    await materialRepository.addHelmetItem('test', 1);
    emit(DataSavedState(selectedCategory: currentState.selectedCategory));
  }
}
