import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

import 'helmet_item.dart';
import 'ladder_item.dart';
import 'scaffold_part_item.dart';

class MaterialListItemView extends StatelessWidget {
  const MaterialListItemView({
    super.key,
    required this.item,
  });

  final MaterialDto item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: switch (item.materialType) {
            MaterialTypeDto.helmet => HelmetItem(
                item: HelmetDto.fromJson(item.json),
              ),
            MaterialTypeDto.ladder => LadderItem(
                item: LadderDto.fromJson(item.json),
              ),
            MaterialTypeDto.scaffoldPart => ScaffoldPartItem(
                item: ScaffoldPartDto.fromJson(item.json),
              ),
          },
        ),
      ),
    );
  }
}
