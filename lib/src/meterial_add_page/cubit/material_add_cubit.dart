import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/contracts.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_data.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(
          ShowDataState(
            materialAddData: MaterialAddData(
              selectedCategory: null,
              helmetItem: HelmetDto(
                id: 0,
                name: '',
                quantity: 0,
              ),
            ),
          ),
        );
  final MaterialRepository materialRepository;

  void pageInit() => emit(
        ShowDataState(
          materialAddData: MaterialAddData(
            selectedCategory: null,
            helmetItem: HelmetDto(
              id: 0,
              name: '',
              quantity: 0,
            ),
          ),
        ),
      );

  void selectForm(MaterialCategory? selectedCategory) => emit(
        ShowDataState(
          materialAddData: MaterialAddData(
            selectedCategory: selectedCategory,
            helmetItem: HelmetDto(
              id: 0,
              name: '',
              quantity: 0,
            ),
          ),
        ),
      );

  Future<void> submitData() async {
    if (state is! ShowDataState) {
      return;
    }

    final currentState = state as ShowDataState;
    final data = currentState.materialAddData;
    final newData = data.copyWith();

    emit(DataSavingState(materialAddData: newData));
    await materialRepository.addHelmetItem('test', 1);
    emit(DataSavedState(materialAddData: newData));
  }

  Future<void> setHelmetName(String name) async {
    if (state is! ShowDataState) {
      return;
    }

    final currentState = state as ShowDataState;
    final data = currentState.materialAddData;
    final newhelmetItem = HelmetDto(
      id: data.helmetItem.id,
      name: data.helmetItem.name,
      quantity: data.helmetItem.quantity,
    );
    final newData = data.copyWith(helmetItem: newhelmetItem);

    emit(ShowDataState(
      materialAddData: newData,
    ));
  }
}
