import 'package:leancode_forms/leancode_forms.dart';
import '../field_cubits/integer_field_cubit.dart';
import '../field_cubits/list_of_integer_field_cubit.dart';

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
  final scaffoldPartImage = ListOfIntegerFieldCubit(
    validator: (value) {
      if (value.isEmpty) {
        return 'Image is required';
      }
    },
  );
}
