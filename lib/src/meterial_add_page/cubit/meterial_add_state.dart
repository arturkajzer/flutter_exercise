import 'package:equatable/equatable.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddState extends Equatable {
  const MaterialAddState({required this.selectedCategory});

  final MaterialCategory? selectedCategory;

  @override
  List<Object?> get props => [selectedCategory];

  // MaterialAddState copyWith({MaterialCategory? selectedCategory}) {
  //   return MaterialAddState(
  //     selectedCategory: selectedCategory ?? this.selectedCategory,
  //   );
  // }
}

class ShowDataState extends MaterialAddState {
  const ShowDataState({required super.selectedCategory});
}

class DataSavingState extends MaterialAddState {
  const DataSavingState({required super.selectedCategory});
}

class DataSavedState extends MaterialAddState {
  const DataSavedState({required super.selectedCategory});
}
