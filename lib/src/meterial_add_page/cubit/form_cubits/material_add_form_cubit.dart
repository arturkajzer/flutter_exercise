import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/field_cubit_helper.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/subforms/helmet_subform_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/subforms/ladder_subform_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/subforms/scaffold_part_subform_cubit.dart';

class MaterialAddFormCubit extends FormGroupCubit {
  MaterialAddFormCubit() {
    registerFields([
      categoryDropDown,
    ]);
  }

  final categoryDropDown = MaterialCategoryFieldCubit();
  final helmetSubForm = HelmetSubformCubit();
  final ladderSubForm = LadderSubformCubit();
  final scaffoldPartSubForm = ScaffoldPartSubformCubit();

  void showHelmetSubForm() {
    addSubform(helmetSubForm);
    removeSubform(ladderSubForm, close: false);
    removeSubform(scaffoldPartSubForm, close: false);
  }

  void showLadderSubForm() {
    addSubform(ladderSubForm);
    removeSubform(helmetSubForm, close: false);
    removeSubform(scaffoldPartSubForm, close: false);
  }

  void showScaffoldPartSubForm() {
    addSubform(scaffoldPartSubForm);
    removeSubform(helmetSubForm, close: false);
    removeSubform(ladderSubForm, close: false);
  }
}
