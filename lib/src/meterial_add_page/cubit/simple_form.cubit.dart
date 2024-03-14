import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/helmet_model.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/ladder_model.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/scaffold_part_model.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddPageCubit extends Cubit<bool> {
  MaterialAddPageCubit({
    required this.materialRepository,
  }) : super(false);

  final MaterialRepository materialRepository;

  void startSaving() {
    emit(true);
  }

  void stopSaving() {
    emit(true);
  }

  Future<void> submitHelmetData(HelmetModel helmet) async {
    startSaving();
    await materialRepository.addHelmetItem(helmet.name, helmet.quantity);
  }

  Future<void> submitLadderData(LadderModel ladder) async {
    startSaving();
    await materialRepository.addLadderItem(
      ladder.name,
      ladder.maximumWorkingHeightInCm,
      ladder.ladderLoadCapacityInKg,
    );
  }

  Future<void> submitScaffoldPartData(ScaffoldPartModel scaffoldPart) async {
    startSaving();
    await materialRepository.addScaffoldPartItem(
      scaffoldPart.name,
      scaffoldPart.quantity,
      Uint8List.fromList(scaffoldPart.imageBytes),
    );
  }
}

class MaterialAddFormCubit extends FormGroupCubit {
  MaterialAddFormCubit() {
    registerFields([
      categoryDropDown,
    ]);
  }

  final categoryDropDown = MaterialCategoryFieldCubit();
  final helmetSubForm = HelmetSubformCubit();
  final ladderSubForm = LadderSubformCubit();
  final scaffoldPartSubForm = ScaffoldPartSubformCubit();

  void showHelmetSubForm() {
    addSubform(helmetSubForm);
    removeSubform(ladderSubForm, close: false);
    removeSubform(scaffoldPartSubForm, close: false);
  }

  void showLadderSubForm() {
    addSubform(ladderSubForm);
    removeSubform(helmetSubForm, close: false);
    removeSubform(scaffoldPartSubForm, close: false);
  }

  void showScaffoldPartSubForm() {
    addSubform(scaffoldPartSubForm);
    removeSubform(helmetSubForm, close: false);
    removeSubform(ladderSubForm, close: false);
  }
}

class IntegerFieldCubit<E extends Object> extends FieldCubit<int, E> {
  IntegerFieldCubit({
    super.initialValue = 0,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });

  bool get isNegative => state.value.isNegative;

  void increment() => setValue(state.value + 1);
  void decrement() => setValue(state.value - 1);
}

class ListOfIntegerFieldCubit<E extends Object>
    extends FieldCubit<List<int>, E> {
  ListOfIntegerFieldCubit({
    super.initialValue = const [],
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}

class MaterialCategoryFieldCubit<E extends Object>
    extends FieldCubit<MaterialCategory?, E> {
  MaterialCategoryFieldCubit({
    super.initialValue,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}

class HelmetSubformCubit extends FormGroupCubit {
  HelmetSubformCubit() {
    registerFields([
      helmetName,
      helmetQuantity,
    ]);
  }

  final helmetName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final helmetQuantity = IntegerFieldCubit();
}

class LadderSubformCubit extends FormGroupCubit {
  LadderSubformCubit() {
    registerFields([
      ladderName,
      ladderMaximumHeight,
      ladderLoadCapacity,
    ]);
  }

  final ladderName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final ladderMaximumHeight = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Maximum working height is required';
      }
    },
  );

  final ladderLoadCapacity = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Ladder load capacity is required';
      }
    },
  );
}

class ScaffoldPartSubformCubit extends FormGroupCubit {
  ScaffoldPartSubformCubit() {
    registerFields([
      scaffoldPartName,
      scaffoldPartQuantity,
      scaffoldPartImage,
    ]);
  }

  final scaffoldPartName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final scaffoldPartQuantity = IntegerFieldCubit();
  final scaffoldPartImage = ListOfIntegerFieldCubit();
}
