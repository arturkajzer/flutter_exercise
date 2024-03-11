import 'package:equatable/equatable.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddState extends Equatable {
  const MaterialAddState({
    required this.selectedCategory,
    required this.helmetModel,
    required this.helmetIsVisible,
    required this.ladderIsVisible,
    required this.scaffoldPartIsVisible,
    required this.number,
  });
  // final String text;
  final HelmetModel helmetModel;
  final bool helmetIsVisible;
  final bool ladderIsVisible;
  final bool scaffoldPartIsVisible;
  final MaterialCategory? selectedCategory;
  final int number;
  
  @override
  List<Object?> get props => [];
}

// class DataSavingState extends MaterialAddState {
//   const DataSavingState({required super.selectedCategory, required super.helmetModel, required super.helmetIsVisible, required super.ladderIsVisible, required super.scaffoldPartIsVisible, required super.number});
// }


class HelmetModel {
  HelmetModel({
    required this.name,
    required this.quantity,
  });

  final String name;
  final String quantity;
}
