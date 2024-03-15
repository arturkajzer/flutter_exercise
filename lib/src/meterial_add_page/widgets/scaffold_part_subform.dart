import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/material_add_form_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_page_cubit.dart';
import 'package:warehouse/src/meterial_add_page/models/scaffold_part_model.dart';
import 'package:warehouse/src/meterial_add_page/widgets/form_fields/form_increment_decrement_field.dart';
import 'package:warehouse/src/meterial_add_page/widgets/form_fields/form_text_field.dart';

class ScaffoldPartSubform extends StatelessWidget {
  const ScaffoldPartSubform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<MaterialAddFormCubit>();
    final pageCubit = context.read<MaterialAddPageCubit>();

    final scaffoldPartNameCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartName;
    final scaffoldPartQuantityCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartQuantity;
    final scaffoldPartImageCubit = context
        .read<MaterialAddFormCubit>()
        .scaffoldPartSubForm
        .scaffoldPartImage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name:'),
        FormTextField(
          field: scaffoldPartNameCubit,
          errorTranslator: (errorMessage) {
            return errorMessage;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Quantity:'),
        FormIncrementDecrementField(
          field: scaffoldPartQuantityCubit,
        ),
        const SizedBox(
          height: 20,
        ),
        FieldBuilder(
          field: scaffoldPartImageCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final imageBytes = await _pickImageFromGallery();
                    scaffoldPartImageCubit.setValue(imageBytes);
                  },
                  child: scaffoldPartImageCubit.state.value.isNotEmpty
                      ? Image.memory(
                          Uint8List.fromList(
                            scaffoldPartImageCubit.state.value,
                          ),
                          width: 200,
                          height: 200,
                        )
                      : Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      state.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  if (formCubit.validate()) {
                    await pageCubit
                        .submitScaffoldPartData(
                          ScaffoldPartModel(
                            name: scaffoldPartNameCubit.state.value,
                            quantity: scaffoldPartQuantityCubit.state.value,
                            imageBytes: scaffoldPartImageCubit.state.value,
                          ),
                        )
                        .then((result) => context.pop<bool>(true));
                  }
                },
                child: const Text(
                  'Add scaffold part',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<List<int>> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      return bytes;
    } else {
      return [];
    }
  }
}
