import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(
          MaterialAddState(
            data: DataItem(
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
          ),
        );

  final MaterialRepository materialRepository;

  void toggleVisibility(MaterialCategory? selectedCategory) {
    final newData = state.data.copyWith(
      selectedCategory: selectedCategory,
      helmetIsVisible: selectedCategory == MaterialCategory.helmet,
      ladderIsVisible: selectedCategory == MaterialCategory.ladder,
      scaffoldPartIsVisible: selectedCategory == MaterialCategory.scaffoldPart,
    );
    emit(MaterialAddState(data: newData));
  }

  void updateHelmetName(String newText) {
    final newData = state.data.copyWith(
      helmetModel:
          HelmetModel(name: newText, quantity: state.data.helmetModel.quantity),
    );
    emit(MaterialAddState(data: newData));
  }

  void increment() {
    final newData = state.data.copyWith(
      helmetModel: HelmetModel(
        name: state.data.helmetModel.name,
        quantity: state.data.helmetModel.quantity + 1,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void decrement() {
    final newData = state.data.copyWith(
      helmetModel: HelmetModel(
        name: state.data.helmetModel.name,
        quantity: state.data.helmetModel.quantity - 1,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  Future<void> submitHelmetData(HelmetModel helmet) async {
    emit(DataIsSaving(data: state.data));
    await materialRepository.addHelmetItem(helmet.name, helmet.quantity);
  }

  //LADDER:

  void updateLadderName(String newText) {
    final newData = state.data.copyWith(
      ladderModel: LadderModel(
        name: newText,
        ladderLoadCapacityInKg: state.data.ladderModel.ladderLoadCapacityInKg,
        maximumWorkingHeightInCm:
            state.data.ladderModel.maximumWorkingHeightInCm,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void updateLadderLoadCapacity(int newLadderLoad) {
    final newData = state.data.copyWith(
      ladderModel: LadderModel(
        name: state.data.ladderModel.name,
        ladderLoadCapacityInKg: newLadderLoad,
        maximumWorkingHeightInCm:
            state.data.ladderModel.maximumWorkingHeightInCm,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void updateLadderMaximumHeight(int newMaxHeight) {
    final newData = state.data.copyWith(
      ladderModel: LadderModel(
        name: state.data.ladderModel.name,
        ladderLoadCapacityInKg: state.data.ladderModel.ladderLoadCapacityInKg,
        maximumWorkingHeightInCm: newMaxHeight,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  Future<void> submitLadderData(LadderModel ladder) async {
    emit(DataIsSaving(data: state.data));
    await materialRepository.addLadderItem(
      ladder.name,
      ladder.maximumWorkingHeightInCm,
      ladder.ladderLoadCapacityInKg,
    );
  }
}
