import 'package:flutter/material.dart';
import 'package:leancode_forms/leancode_forms.dart';

class FormTextField<E extends Object> extends FieldBuilder<String, E> {
  FormTextField({
    super.key,
    required TextFieldCubit<E> super.field,
    required ErrorTranslator<E> errorTranslator,
    TextInputType? keyboardType,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
  }) : super(
          builder: (context, state) => TextFormField(
            onChanged: field.getValueSetter(),
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              errorText:
                  state.error != null ? errorTranslator(state.error!) : null,
            ),
          ),
        );
}
