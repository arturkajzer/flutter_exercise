import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/scaffold_part_model.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

import 'models/helmet_model.dart';
import 'models/ladder_model.dart';

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
    required ScaffoldPartModel scaffoldPartModel,
    required bool helmetIsVisible,
    required bool ladderIsVisible,
    required bool scaffoldPartIsVisible,
  }) = _DataItem;
}
