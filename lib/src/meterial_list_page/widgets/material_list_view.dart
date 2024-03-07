import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

class MaterialListView extends StatelessWidget {
  const MaterialListView({
    super.key,
    required this.data,
  });

  final List<MaterialDto> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        //final assignment = data[index];
        return const ListTile(
          title: Text('OK'),
        );
      },
    );
  }
}
