import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/field_cubit_helper.dart';

class ScaffoldPartSubformCubit extends FormGroupCubit {
  ScaffoldPartSubformCubit() {
    registerFields([
      scaffoldPartName,
      scaffoldPartQuantity,
      scaffoldPartImage,
    ]);
  }

  final scaffoldPartName = TextFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Name is required';
      }
    },
  );

  final scaffoldPartQuantity = IntegerFieldCubit();
  final scaffoldPartImage = ListOfIntegerFieldCubit();
}
