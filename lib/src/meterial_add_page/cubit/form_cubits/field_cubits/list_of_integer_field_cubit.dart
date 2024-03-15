import 'package:leancode_forms/leancode_forms.dart';

class ListOfIntegerFieldCubit<E extends Object>
    extends FieldCubit<List<int>, E> {
  ListOfIntegerFieldCubit({
    super.initialValue = const [],
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}
