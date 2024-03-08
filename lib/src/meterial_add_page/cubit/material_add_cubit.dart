import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/meterial_list_page/cubit/material_list_cubit.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
    required this.materialListCubit,
  }) : super(const ShowDataState(selectedCategory: null));
  final MaterialRepository materialRepository;
  final MaterialListCubit materialListCubit;

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
    await materialListCubit.run();
    emit(DataSavedState(selectedCategory: currentState.selectedCategory));
  }
}
