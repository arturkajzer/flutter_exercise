import 'package:cqrs/cqrs.dart';
import 'package:warehouse/src/data/contracts.dart';

class MaterialRepository {
  MaterialRepository({
    required Cqrs cqrs,
  }) : _cqrs = cqrs;

  final Cqrs _cqrs;

  Future<QueryResult<List<MaterialDto>>> getAllMeterial() async {
    final query = AllMaterials();
    final result = await _cqrs.get(query);
    return result;
  }
}
