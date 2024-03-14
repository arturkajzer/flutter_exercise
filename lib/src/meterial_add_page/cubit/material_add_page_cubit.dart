import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/helmet_model.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/ladder_model.dart';
import 'package:warehouse/src/meterial_add_page/cubit/models/scaffold_part_model.dart';

class MaterialAddPageCubit extends Cubit<bool> {
  MaterialAddPageCubit({
    required this.materialRepository,
  }) : super(false);

  final MaterialRepository materialRepository;

  void startSaving() {
    emit(true);
  }

  void stopSaving() {
    emit(true);
  }

  Future<void> submitHelmetData(HelmetModel helmet) async {
    startSaving();
    await materialRepository.addHelmetItem(helmet.name, helmet.quantity);
  }

  Future<void> submitLadderData(LadderModel ladder) async {
    startSaving();
    await materialRepository.addLadderItem(
      ladder.name,
      ladder.maximumWorkingHeightInCm,
      ladder.ladderLoadCapacityInKg,
    );
  }

  Future<void> submitScaffoldPartData(ScaffoldPartModel scaffoldPart) async {
    startSaving();
    await materialRepository.addScaffoldPartItem(
      scaffoldPart.name,
      scaffoldPart.quantity,
      Uint8List.fromList(scaffoldPart.imageBytes),
    );
  }
}
