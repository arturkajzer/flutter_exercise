import 'package:leancode_forms/leancode_forms.dart';

class LadderSubformCubit extends FormGroupCubit {
  LadderSubformCubit() {
    registerFields([
      ladderName,
      ladderMaximumHeight,
      ladderLoadCapacity,
    ]);
  }

  final ladderName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final ladderMaximumHeight = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Maximum working height is required';
      }
    },
  );

  final ladderLoadCapacity = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Ladder load capacity is required';
      }
    },
  );
}
