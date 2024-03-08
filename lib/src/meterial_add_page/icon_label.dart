import 'package:flutter/material.dart';

enum MaterialCategory {
  helmet(
    'Helmet',
    Icons.health_and_safety,
  ),
  ladder(
    'Ladder',
    Icons.height,
  ),
  scaffoldPart(
    'Scaffold part',
    Icons.construction,
  ),
  ;

  const MaterialCategory(this.label, this.icon);
  final String label;
  final IconData icon;
}
