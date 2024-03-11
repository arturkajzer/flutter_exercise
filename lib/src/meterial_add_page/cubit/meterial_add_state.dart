import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

part 'meterial_add_state.freezed.dart';

@freezed
class MaterialAddState with _$MaterialAddState {
  const factory MaterialAddState({
    required MaterialCategory? selectedCategory,
    required HelmetModel helmetModel,
    required LadderModel ladderModel,
    required bool helmetIsVisible,
    required bool ladderIsVisible,
    required bool scaffoldPartIsVisible,
  }) = _MaterialAddState;
}

class HelmetModel {
  HelmetModel({
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;
}

class LadderModel {
  LadderModel({
    required this.name,
    required this.maximumWorkingHeightInCm,
    required this.ladderLoadCapacityInKg,
  });

  final String name;
  final int maximumWorkingHeightInCm;
  final int ladderLoadCapacityInKg;
}
