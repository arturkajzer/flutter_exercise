import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/models/icon_label.dart';

class IntegerFieldCubit<E extends Object> extends FieldCubit<int, E> {
  IntegerFieldCubit({
    super.initialValue = 0,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });

  bool get isNegative => state.value.isNegative;

  void increment() => setValue(state.value + 1);
  void decrement() => setValue(state.value - 1);
}

class ListOfIntegerFieldCubit<E extends Object>
    extends FieldCubit<List<int>, E> {
  ListOfIntegerFieldCubit({
    super.initialValue = const [],
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}

class MaterialCategoryFieldCubit<E extends Object>
    extends FieldCubit<MaterialCategory?, E> {
  MaterialCategoryFieldCubit({
    super.initialValue,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}
