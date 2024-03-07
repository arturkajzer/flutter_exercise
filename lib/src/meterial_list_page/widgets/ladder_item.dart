import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

class LadderItem extends StatelessWidget {
  const LadderItem({
    super.key,
    required this.item,
  });

  final LadderDto item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          children: [
            Icon(Icons.height),
            SizedBox(width: 8),
            Text('Ladders'),
          ],
        ),
        Text(
          item.name,
          style: const TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            Text(
              '${item.ladderLoadCapacityInKg} kg',
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${item.maximumWorkingHeightInCm} cm',
            ),
          ],
        ),
      ],
    );
  }
}
