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
