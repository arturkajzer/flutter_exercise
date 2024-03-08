import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';

class MaterialAddCubit extends Cubit<IconLabel?> {
  MaterialAddCubit() : super(null);

  void selectForm(IconLabel? selectedForm) => emit(selectedForm);
}
