// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelmetDto _$HelmetDtoFromJson(Map<String, dynamic> json) => HelmetDto(
      id: json['id'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$HelmetDtoToJson(HelmetDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
    };

LadderDto _$LadderDtoFromJson(Map<String, dynamic> json) => LadderDto(
      id: json['id'] as int,
      name: json['name'] as String,
      maximumWorkingHeightInCm: json['maximumWorkingHeightInCm'] as int,
      ladderLoadCapacityInKg: json['ladderLoadCapacityInKg'] as int,
    );

Map<String, dynamic> _$LadderDtoToJson(LadderDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maximumWorkingHeightInCm': instance.maximumWorkingHeightInCm,
      'ladderLoadCapacityInKg': instance.ladderLoadCapacityInKg,
    };

ScaffoldPartDto _$ScaffoldPartDtoFromJson(Map<String, dynamic> json) =>
    ScaffoldPartDto(
      id: json['id'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      imageBytes:
          (json['imageBytes'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ScaffoldPartDtoToJson(ScaffoldPartDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'imageBytes': instance.imageBytes,
    };

MaterialDto _$MaterialDtoFromJson(Map<String, dynamic> json) => MaterialDto(
      materialType: $enumDecode(_$MaterialTypeDtoEnumMap, json['materialType']),
      json: json['json'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MaterialDtoToJson(MaterialDto instance) =>
    <String, dynamic>{
      'materialType': _$MaterialTypeDtoEnumMap[instance.materialType]!,
      'json': instance.json,
    };

const _$MaterialTypeDtoEnumMap = {
  MaterialTypeDto.helmet: 'helmet',
  MaterialTypeDto.ladder: 'ladder',
  MaterialTypeDto.scaffoldPart: 'scaffoldPart',
};
