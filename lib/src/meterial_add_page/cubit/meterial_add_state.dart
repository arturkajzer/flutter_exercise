import 'package:equatable/equatable.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_data.dart';

class MaterialAddState extends Equatable {
  const MaterialAddState({
    required this.materialAddData,
  });

  final MaterialAddData materialAddData;

  @override
  List<Object?> get props => [materialAddData];
}

class ShowDataState extends MaterialAddState {
  const ShowDataState({required super.materialAddData});
}

class DataSavingState extends MaterialAddState {
  const DataSavingState({required super.materialAddData});
}

class DataSavedState extends MaterialAddState {
  const DataSavedState({required super.materialAddData});
}
