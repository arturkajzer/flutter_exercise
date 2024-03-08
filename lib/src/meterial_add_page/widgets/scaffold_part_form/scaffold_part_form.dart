import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

class ScaffoldPartForm extends HookWidget {
  const ScaffoldPartForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Column(
      children: [
        FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name: '),
              FormBuilderTextField(
                name: 'name',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Quantity: '),
              FormBuilderTextField(
                name: 'quantity',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
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
  
                        if (formKey.currentState!.saveAndValidate()) {
                          //print('OK');
                        }

                        // final materialRepository = context.read<MaterialRepository>();
                        // await  materialRepository.addHelmetItem('test', 1);
                        // final materialListCubit = context.read<MaterialListCubit>();
                        // await materialListCubit.run();
                        //MaterialListRoute().go(context);
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
          ),
        ),
      ],
    );
  }
}
