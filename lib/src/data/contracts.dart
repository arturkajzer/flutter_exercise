// ignore_for_file: sort_constructors_first

import 'dart:typed_data';

import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contracts.g.dart';

class AddHelmet implements Command {
  AddHelmet({
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;

  @override
  String getFullName() => 'Contracts.AddHelmet';

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class AddLadder implements Command {
  AddLadder({
    required this.name,
    required this.maximumWorkingHeightInCm,
    required this.ladderLoadCapacityInKg,
  });

  final String name;
  final int maximumWorkingHeightInCm;
  final int ladderLoadCapacityInKg;

  @override
  String getFullName() => 'Contracts.AddLadder';

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class AddScaffoldPart implements Command {
  AddScaffoldPart({
    required this.imageBytes,
    required this.quantity,
    required this.name,
  });

  final String name;
  final Uint8List imageBytes;
  final int quantity;

  @override
  String getFullName() => 'Contracts.AddScaffoldPart';

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class AllMaterials implements Query<List<MaterialDto>> {
  @override
  String getFullName() => 'Contracts.AllMaterials';

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  List<MaterialDto> resultFactory(dynamic json) {
    throw UnimplementedError();
  }
}

@JsonSerializable()
class HelmetDto {
  HelmetDto({
    required this.id,
    required this.name,
    required this.quantity,
  });

  final int id;
  final String name;
  final int quantity;

  factory HelmetDto.fromJson(Map<String, dynamic> json) =>
      _$HelmetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HelmetDtoToJson(this);
}

@JsonSerializable()
class LadderDto {
  LadderDto({
    required this.id,
    required this.name,
    required this.maximumWorkingHeightInCm,
    required this.ladderLoadCapacityInKg,
  });

  final int id;
  final String name;
  final int maximumWorkingHeightInCm;
  final int ladderLoadCapacityInKg;

  factory LadderDto.fromJson(Map<String, dynamic> json) =>
      _$LadderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LadderDtoToJson(this);
}

@JsonSerializable()
class ScaffoldPartDto {
  ScaffoldPartDto({
    required this.id,
    required this.name,
    required this.quantity,
    required this.imageBytes,
  });

  final int id;
  final String name;
  final int quantity;
  final List<int> imageBytes;

  factory ScaffoldPartDto.fromJson(Map<String, dynamic> json) =>
      _$ScaffoldPartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ScaffoldPartDtoToJson(this);
}

@JsonSerializable()
class MaterialDto {
  MaterialDto({
    required this.materialType,
    required this.json,
  });

  final MaterialTypeDto materialType;
  final Map<String, dynamic> json;

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialDtoToJson(this);
}

enum MaterialTypeDto {
  helmet,
  ladder,
  scaffoldPart,
}
