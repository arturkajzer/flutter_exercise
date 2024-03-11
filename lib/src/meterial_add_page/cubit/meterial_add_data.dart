import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/src/data/contracts.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

part 'meterial_add_data.freezed.dart';

@freezed
class MaterialAddData with _$MaterialAddData {
  factory MaterialAddData({
    required MaterialCategory? selectedCategory,
    required HelmetDto helmetItem,
  }) = _MaterialAddData;
}
