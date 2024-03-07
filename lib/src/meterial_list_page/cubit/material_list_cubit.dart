import 'dart:async';

import 'package:cqrs/cqrs.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:warehouse/src/data/contracts.dart';
import 'package:warehouse/src/data/material_repository.dart';

class MaterialListCubit
    extends QueryCubit<List<MaterialDto>, List<MaterialDto>> {
  MaterialListCubit({required MaterialRepository materialRepository})
      : _materialRepository = materialRepository,
        super('ProjectDetailsCubit');

  final MaterialRepository _materialRepository;

  @override
  List<MaterialDto> map(List<MaterialDto> data) => data;

  @override
  Future<QueryResult<List<MaterialDto>>> request() {
    return _materialRepository.getAllMeterial();
  }
}
