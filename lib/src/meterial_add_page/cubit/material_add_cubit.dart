import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/scaffold_part_model.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

import 'models/helmet_model.dart';
import 'models/ladder_model.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
  }) : super(
          MaterialAddState(
            data: DataItem(
              selectedCategory: null,
              helmetModel: HelmetModel(
                name: '',
                quantity: 1,
              ),
              ladderModel: LadderModel(
                name: '',
                ladderLoadCapacityInKg: 0,
                maximumWorkingHeightInCm: 0,
              ),
              scaffoldPartModel: ScaffoldPartModel(
                name: '',
                quantity: 1,
                imageBytes: [],
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

  void helmetQuantityIncrement() {
    final newData = state.data.copyWith(
      helmetModel: HelmetModel(
        name: state.data.helmetModel.name,
        quantity: state.data.helmetModel.quantity + 1,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void helmetQuantityDecrement() {
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

  // SCAFFOLD PART:

  void updateScaffoldPartName(String newText) {
    final newData = state.data.copyWith(
      scaffoldPartModel: ScaffoldPartModel(
        name: newText,
        quantity: state.data.scaffoldPartModel.quantity,
        imageBytes: state.data.scaffoldPartModel.imageBytes,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void updateScaffoldPartImage(List<int> newImg) {
    final newData = state.data.copyWith(
      scaffoldPartModel: ScaffoldPartModel(
        name: state.data.scaffoldPartModel.name,
        quantity: state.data.scaffoldPartModel.quantity,
        imageBytes: newImg,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  Future<void> submitScaffoldPartData(ScaffoldPartModel scaffoldPart) async {
    emit(DataIsSaving(data: state.data));
    await materialRepository.addScaffoldPartItem(
      scaffoldPart.name,
      scaffoldPart.quantity,
      Uint8List.fromList(scaffoldPart.imageBytes),
    );
  }

  void scaffoldPartQuantityIncrement() {
    final newData = state.data.copyWith(
      scaffoldPartModel: ScaffoldPartModel(
        name: state.data.scaffoldPartModel.name,
        quantity: state.data.scaffoldPartModel.quantity + 1,
        imageBytes: state.data.scaffoldPartModel.imageBytes,
      ),
    );
    emit(MaterialAddState(data: newData));
  }

  void scaffoldPartQuantityDecrement() {
    final newData = state.data.copyWith(
      scaffoldPartModel: ScaffoldPartModel(
        name: state.data.scaffoldPartModel.name,
        quantity: state.data.scaffoldPartModel.quantity - 1,
        imageBytes: state.data.scaffoldPartModel.imageBytes,
      ),
    );
    emit(MaterialAddState(data: newData));
  }
}
