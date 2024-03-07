import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

class ScaffoldPartItem extends StatelessWidget {
  const ScaffoldPartItem({
    super.key,
    required this.item,
  });

  final ScaffoldPartDto item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          children: [
            Icon(Icons.construction),
            SizedBox( width: 8,),
            Text('Scaffold Parts'),
          ],
        ),
        Text(
          item.name,
          style: const TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            Text(
              '${item.quantity}x',
            ),
          ],
        ),
      ],
    );
  }
}
