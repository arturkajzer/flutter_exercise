class ScaffoldPartModel {
  ScaffoldPartModel({
    required this.name,
    required this.quantity,
    required this.imageBytes,
  });

  final String name;
  final int quantity;
  final List<int> imageBytes;
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
