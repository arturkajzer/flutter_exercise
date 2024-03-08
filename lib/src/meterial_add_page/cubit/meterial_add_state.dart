import 'package:equatable/equatable.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

sealed class MaterialAddState extends Equatable {
  const MaterialAddState();
}

class PageInitialState extends MaterialAddState {
  const PageInitialState();

  @override
  List<Object> get props => [];
}

// class ErrorState extends HelmetFormState {
//   @override
//   List<Object> get props => [];
// }

class MaterialAddDataState extends MaterialAddState {
  const MaterialAddDataState({
    required this.selectedCategory,
    required this.helmetName,
  });

  final MaterialCategory? selectedCategory;
  final String helmetName;

  @override
  List<Object?> get props => [selectedCategory];
}

class DataSavingState extends MaterialAddState {
  const DataSavingState();

  @override
  List<Object> get props => [];
}

class DataSavedState extends MaterialAddState {
  const DataSavedState();

  @override
  List<Object> get props => [];
}
