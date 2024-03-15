import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/models/icon_label.dart';

class MaterialCategoryFieldCubit<E extends Object>
    extends FieldCubit<MaterialCategory?, E> {
  MaterialCategoryFieldCubit({
    super.initialValue,
    super.validator,
    super.asyncValidator,
    super.asyncValidationDebounce,
  });
}
