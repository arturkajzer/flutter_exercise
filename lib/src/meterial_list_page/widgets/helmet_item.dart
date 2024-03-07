import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

class HelmetItem extends StatelessWidget {
  const HelmetItem({
    super.key,
    required this.item,
  });

  final HelmetDto item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          children: [
            Icon(Icons.health_and_safety),
            SizedBox(width: 8),
            Text('Helmets'),
          ],
        ),
        Text(
          item.name,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          '${item.quantity}x',
        ),
      ],
    );
  }
}
