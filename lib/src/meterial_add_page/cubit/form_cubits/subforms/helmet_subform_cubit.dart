import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/field_cubit_helper.dart';

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
