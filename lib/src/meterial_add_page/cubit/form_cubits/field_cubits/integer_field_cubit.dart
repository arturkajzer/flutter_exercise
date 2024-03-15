import 'package:leancode_forms/leancode_forms.dart';

class IntegerFieldCubit<E extends Object> extends FieldCubit<int, E> {
  IntegerFieldCubit({
    super.initialValue = 1,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });

  bool get isNegative => state.value.isNegative;

  void increment() => setValue(state.value + 1);
  void decrement() => setValue(state.value - 1);
}
