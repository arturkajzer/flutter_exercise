import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/src/data/material_repository.dart';
import 'package:warehouse/src/meterial_add_page/cubit/meterial_add_state.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/meterial_list_page/cubit/material_list_cubit.dart';

class MaterialAddCubit extends Cubit<MaterialAddState> {
  MaterialAddCubit({
    required this.materialRepository,
    required this.materialListCubit,
  }) : super(const PageInitialState());
  final MaterialRepository materialRepository;
  final MaterialListCubit materialListCubit;

  void pageInit() => emit(
        const MaterialAddDataState(
          selectedCategory: null,
          helmetName: '',
        ),
      );

  void selectForm(MaterialCategory selectedForm) => emit(
        MaterialAddDataState(
          selectedCategory: selectedForm,
          helmetName: 'test',
        ),
      );

  Future<void> submitData() async {
    if (state is! MaterialAddDataState) {
      return;
    }

    emit(const DataSavingState());
    await materialRepository.addHelmetItem('test', 1);
    await materialListCubit.run();
    emit(const DataSavedState());
  }
}
