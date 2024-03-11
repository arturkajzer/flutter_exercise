// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:leancode_hooks/leancode_hooks.dart';
// import 'package:warehouse/src/meterial_add_page/cubit/material_add_cubit.dart';

// class HelmetForm extends HookWidget {
//   const HelmetForm(this.materialAddCubit, {super.key});

//   final MaterialAddCubit materialAddCubit;

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormBuilderState>();

//     return Column(
//       children: [
//         FormBuilder(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Name: '),
//               FormBuilderTextField(
//                 name: 'name',
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                 ]),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text('Quantity: '),
//               FormBuilderTextField(
//                 name: 'quantity',
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                 ]),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       color: Theme.of(context).colorScheme.primary,
//                       onPressed: () async {
//                         if (formKey.currentState!.saveAndValidate()) {
//                           await materialAddCubit.submitData();
//                         }
//                       },
//                       child: const Text(
//                         'Add helmet',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
