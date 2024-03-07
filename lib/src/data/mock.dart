import 'package:cqrs/cqrs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse/src/data/contracts.dart';
import 'package:warehouse/src/data/images.g.dart';

Cqrs createCqrs() {
  final cqrs = _MockCqrs();

  return cqrs;
}

class _MockCqrs extends Mock implements Cqrs {
  int _nextId = _materials.length;

  @override
  Future<CommandResult> run(
    Command command, {
    Map<String, String> headers = const {},
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (command is AddHelmet) {
      _materials.add(
        MaterialDto(
          json: HelmetDto(
            id: ++_nextId,
            name: command.name,
            quantity: command.quantity,
          ).toJson(),
          materialType: MaterialTypeDto.helmet,
        ),
      );
      return const CommandSuccess();
    } else if (command is AddLadder) {
      _materials.add(
        MaterialDto(
          json: LadderDto(
            id: ++_nextId,
            name: command.name,
            maximumWorkingHeightInCm: command.maximumWorkingHeightInCm,
            ladderLoadCapacityInKg: command.ladderLoadCapacityInKg,
          ).toJson(),
          materialType: MaterialTypeDto.ladder,
        ),
      );
      return const CommandSuccess();
    } else if (command is AddScaffoldPart) {
      _materials.add(
        MaterialDto(
          json: ScaffoldPartDto(
            id: ++_nextId,
            name: command.name,
            quantity: command.quantity,
            imageBytes: command.imageBytes,
          ).toJson(),
          materialType: MaterialTypeDto.scaffoldPart,
        ),
      );
      return const CommandSuccess();
    }

    throw UnimplementedError();
  }

  @override
  Future<QueryResult<T>> get<T>(
    Query<T> query, {
    Map<String, String> headers = const {},
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (query is AllMaterials) {
      return QuerySuccess<T>(_materials as T);
    }

    throw UnimplementedError();
  }
}

final _materials = <MaterialDto>[
  MaterialDto(
    materialType: MaterialTypeDto.helmet,
    json: HelmetDto(id: 0, name: 'Blue helmet', quantity: 12).toJson(),
  ),
  MaterialDto(
    materialType: MaterialTypeDto.ladder,
    json: LadderDto(
      id: 1,
      name: 'Stepladder',
      maximumWorkingHeightInCm: 180,
      ladderLoadCapacityInKg: 150,
    ).toJson(),
  ),
  MaterialDto(
    materialType: MaterialTypeDto.ladder,
    json: LadderDto(
      id: 2,
      name: 'Straight ladder',
      maximumWorkingHeightInCm: 600,
      ladderLoadCapacityInKg: 150,
    ).toJson(),
  ),
  MaterialDto(
    materialType: MaterialTypeDto.helmet,
    json: HelmetDto(id: 3, name: 'Yellow helmet', quantity: 20).toJson(),
  ),
  MaterialDto(
    materialType: MaterialTypeDto.scaffoldPart,
    json: ScaffoldPartDto(
      id: 4,
      name: 'Scaffold caster 8"',
      quantity: 4,
      imageBytes: scaffoldCasterBytes,
    ).toJson(),
  ),
];
