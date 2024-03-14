import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leancode_forms/leancode_forms.dart';
import 'package:warehouse/src/meterial_add_page/cubit/form_cubits/material_add_form_cubit.dart';
import 'package:warehouse/src/meterial_add_page/cubit/material_add_page_cubit.dart';
import 'package:warehouse/src/meterial_add_page/models/scaffold_part_model.dart';

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
        FieldBuilder(
          field: scaffoldPartNameCubit,
          builder: (context, state) {
            return TextFormField(
              initialValue: state.value,
              textInputAction: TextInputAction.next,
              onChanged: scaffoldPartNameCubit.getValueSetter(),
              decoration: InputDecoration(errorText: state.error),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Quantity:'),
        FieldBuilder(
          field: scaffoldPartQuantityCubit,
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: scaffoldPartQuantityCubit.decrement,
                ),
                const SizedBox(width: 10),
                Text('${scaffoldPartQuantityCubit.state.value}'),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: scaffoldPartQuantityCubit.increment,
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FieldBuilder(
          field: scaffoldPartImageCubit,
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                final imageBytes = await _pickImageFromGallery();
                scaffoldPartImageCubit.setValue(imageBytes);
              },
              child: scaffoldPartImageCubit.state.value.isNotEmpty
                  ? Image.memory(
                      Uint8List.fromList(scaffoldPartImageCubit.state.value),
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
