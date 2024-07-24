import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CustomInput {

  static InputDecoration inputDecoration({
    required String hint,
    required String label,
  }) {
    return InputDecoration(      
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(95, 99, 109, 1)
        )
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(95, 99, 109, 1)
        )
      ),filled: true,
      fillColor: const Color.fromRGBO(55, 57, 63,1),
      hintText: hint,
      labelText: label,
      hintStyle:CustomLabels.hintFormStyle,
      labelStyle:CustomLabels.labelFormStyle
    );
  }

}