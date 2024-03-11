import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddState {
  MaterialAddState({
    required this.selectedCategory,
    required this.helmetModel,
    required this.helmetIsVisible,
    required this.ladderIsVisible,
    required this.number,
  });
  // final String text;
  final HelmetModel helmetModel;
  final bool helmetIsVisible;
  final bool ladderIsVisible;
  final MaterialCategory? selectedCategory;
  final int number;
}

class HelmetModel {
  HelmetModel({
    required this.name,
    required this.quantity,
  });

  final String name;
  final String quantity;
}
