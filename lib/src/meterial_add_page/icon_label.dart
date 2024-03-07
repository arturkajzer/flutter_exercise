import 'package:flutter/material.dart';

enum IconLabel {
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

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}
