import 'package:flutter/material.dart';
import 'package:leancode_forms/leancode_forms.dart';
import '../../cubit/form_cubits/field_cubits/integer_field_cubit.dart';

class FormIncrementDecrementField<E extends Object>
    extends FieldBuilder<int, E> {
  FormIncrementDecrementField({
    super.key,
    required IntegerFieldCubit<E> super.field,
  }) : super(
          builder: (context, state) => Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: field.decrement,
              ),
              const SizedBox(width: 10),
              Text('${field.state.value}'),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: field.increment,
              ),
            ],
          ),
        );
}
