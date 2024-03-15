import 'package:leancode_forms/leancode_forms.dart';
import '../field_cubits/integer_field_cubit.dart';

class HelmetSubformCubit extends FormGroupCubit {
  HelmetSubformCubit() {
    registerFields([
      helmetName,
      helmetQuantity,
    ]);
  }

  final helmetName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final helmetQuantity = IntegerFieldCubit();
}
