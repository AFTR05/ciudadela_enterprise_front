import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String)? onFieldSubmitted;             
  

  const PasswordInput({Key? key, required this.onChanged, this.onFieldSubmitted})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value){
        return !Validator.passwordValidator(value)
          ?  'La contraseña debe cumplir con los siguientes requisitos:\n* Al menos 8 caracteres\n* Al menos 1 letra mayúscula\n* Al menos 1 letra minúscula\n* Al menos 1 caracter especial'
          :   null;
          },
          
      decoration: InputDecoration(
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
        hintText: 'Ingresa tu contraseña',
        labelText: 'Contraseña',
        suffixIcon: IconButton(
          color: const Color.fromRGBO(135, 144, 181,1),
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleObscureText,
        ),
        hintStyle:CustomLabels.hintFormStyle,
        labelStyle:CustomLabels.labelFormStyle
      ),
      obscureText: _obscureText,
      onChanged: widget.onChanged,
    );
  }
}
