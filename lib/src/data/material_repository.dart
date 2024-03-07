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

  Future<CommandResult> addHelmetItem(String name, int quantity) async {
    final result = await _cqrs.run(
      AddHelmet(
        name: name,
        quantity: quantity,
      ),
    );
    return result;
  }
}
