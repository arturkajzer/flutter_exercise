import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

part 'meterial_add_state.freezed.dart';

class MaterialAddState extends Equatable {
  const MaterialAddState({required this.data}) : super();

  final DataItem data;

  @override
  List<Object?> get props => [data];
}

class DataIsSaving extends MaterialAddState {
  const DataIsSaving({required super.data});

  @override
  List<Object?> get props => [];
}

@freezed
class DataItem with _$DataItem {
  const factory DataItem({
    required MaterialCategory? selectedCategory,
    required HelmetModel helmetModel,
    required LadderModel ladderModel,
    required bool helmetIsVisible,
    required bool ladderIsVisible,
    required bool scaffoldPartIsVisible,
  }) = _DataItem;
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

// sealed class MaterialAddState extends Equatable {
//   const MaterialAddState();
// }

// class DataSaving extends MaterialAddState {
//   @override
//   List<Object?> get props => [];
// }

// @freezed
// class MaterialAddState with _$MaterialAddState {
//   const factory MaterialAddState({
//     required MaterialCategory? selectedCategory,
//     required HelmetModel helmetModel,
//     required LadderModel ladderModel,
//     required bool helmetIsVisible,
//     required bool ladderIsVisible,
//     required bool scaffoldPartIsVisible,
//   }) = _MaterialAddState;
// }
