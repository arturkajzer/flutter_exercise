import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(
          MaterialAddState(
            selectedCategory: null,
            helmetModel: HelmetModel(name: '', quantity: 1),
            ladderModel: LadderModel(
              name: '',
              ladderLoadCapacityInKg: 0,
              maximumWorkingHeightInCm: 0,
            ),
            helmetIsVisible: false,
            ladderIsVisible: false,
            scaffoldPartIsVisible: false,
          ),
        );

  final MaterialRepository materialRepository;

  void toggleVisibility(MaterialCategory? selectedCategory) {
    final newState = state.copyWith(
      selectedCategory: selectedCategory,
      helmetIsVisible: selectedCategory == MaterialCategory.helmet,
      ladderIsVisible: selectedCategory == MaterialCategory.ladder,
      scaffoldPartIsVisible: selectedCategory == MaterialCategory.scaffoldPart,
    );
    emit(newState);
  }

  void updateHelmetName(String newText) {
    final newState = state.copyWith(
      helmetModel:
          HelmetModel(name: newText, quantity: state.helmetModel.quantity),
    );
    emit(newState);
  }

  void increment() {
    final newState = state.copyWith(
      helmetModel: HelmetModel(
        name: state.helmetModel.name,
        quantity: state.helmetModel.quantity + 1,
      ),
    );
    emit(newState);
  }

  void decrement() {
    final newState = state.copyWith(
      helmetModel: HelmetModel(
        name: state.helmetModel.name,
        quantity: state.helmetModel.quantity - 1,
      ),
    );
    emit(newState);
  }

  Future<void> submitHelmetData(HelmetModel helmet) async {
    // if (state is! ShowDataState) {
    //   return;
    // }

    // final currentState = state as ShowDataState;
    // final data = currentState.materialAddData;
    // final newData = data.copyWith();

    // emit(DataSavingState(materialAddData: newData));

    await materialRepository.addHelmetItem(helmet.name, helmet.quantity);
    // emit(DataSavedState(materialAddData: newData));
  }

  //LADDER:

  void updateLadderName(String newText) {
    final newState = state.copyWith(
      ladderModel: LadderModel(
        name: newText,
        ladderLoadCapacityInKg: state.ladderModel.ladderLoadCapacityInKg,
        maximumWorkingHeightInCm: state.ladderModel.maximumWorkingHeightInCm,
      ),
    );
    emit(newState);
  }

  void updateLadderLoadCapacity(int newLadderLoad) {
    final newState = state.copyWith(
      ladderModel: LadderModel(
        name: state.ladderModel.name,
        ladderLoadCapacityInKg: newLadderLoad,
        maximumWorkingHeightInCm: state.ladderModel.maximumWorkingHeightInCm,
      ),
    );
    emit(newState);
  }

  void updateLadderMaximumHeight(int newMaxHeight) {
    final newState = state.copyWith(
      ladderModel: LadderModel(
        name: state.ladderModel.name,
        ladderLoadCapacityInKg: state.ladderModel.ladderLoadCapacityInKg,
        maximumWorkingHeightInCm: newMaxHeight,
      ),
    );
    emit(newState);
  }

  Future<void> submitLadderData(LadderModel ladder) async {
    await materialRepository.addLadderItem(
      ladder.name,
      ladder.maximumWorkingHeightInCm,
      ladder.ladderLoadCapacityInKg,
    );
  }
}
