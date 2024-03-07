import 'package:flutter/material.dart';
import 'package:warehouse/src/data/contracts.dart';

class MaterialListItemView extends StatelessWidget {
  const MaterialListItemView({
    super.key,
    required this.item,
  });

  final MaterialDto item;

  @override
  Widget build(BuildContext context) {
    // final materialTypeStr = item.materialType.toString();
    // final materialDto;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: switch (item.materialType) {
            MaterialTypeDto.helmet => HelmetItem(),
            MaterialTypeDto.ladder => LadderItem(),
            MaterialTypeDto.scaffoldPart => ScaffoldPartItem(),
          }),
    );

    // switch (item.materialType) {
    //   case MaterialTypeDto.helmet:
    //     return HelmetItem();

    //   case MaterialTypeDto.ladder:
    //     return LadderItem();

    //   case MaterialTypeDto.scaffoldPart:
    //     return ScaffoldPartItem();
    // }
  }
}

class HelmetItem extends StatelessWidget {
  const HelmetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('HELMET'),
    );
  }
}

class LadderItem extends StatelessWidget {
  const LadderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('LADDER'),
    );
  }
}

class ScaffoldPartItem extends StatelessWidget {
  const ScaffoldPartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('SCAFFOLD PART'),
    );
  }
}

// class HelmetItem extends StatelessWidget {
//   const HelmetItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.black,
//             width: 1.0,
//           ),
//         ),
//         child: const ListTile(
//           title: Text('SCAFFOLD PART'),
//         ),
//       ),
//     );
//   }
// }

// class LadderItem extends StatelessWidget {
//   const LadderItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.black,
//             width: 1.0,
//           ),
//         ),
//         child: const ListTile(
//           title: Text('SCAFFOLD PART'),
//         ),
//       ),
//     );
//   }
// }

// class ScaffoldPartItem extends StatelessWidget {
//   const ScaffoldPartItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.black,
//             width: 1.0,
//           ),
//         ),
//         child: const ListTile(
//           title: Text('SCAFFOLD PART'),
//         ),
//       ),
//     );
//   }
// }
