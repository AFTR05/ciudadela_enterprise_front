import 'package:email_validator/email_validator.dart';

class Validator {
  static final RegExp passwordRegexp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$',
  );
  static final RegExp e164PhoneNumberRegExp = RegExp(r'^\+?[0-9]{10}$');
  

  static final RegExp alphabetic = RegExp(r'^[a-zA-Z ]+$');

  static bool passwordValidator(String? value) {
    return (passwordRegexp.hasMatch(value!)) ? true : false;
  }

  static bool emailValidator(String? value) {
    return (EmailValidator.validate(value ?? '')) ? true : false;
  }

  static bool emptyValidator(String? value) {
    return ((value ?? '').isNotEmpty) ? true : false;
  } //El campo no puede estar vacío

  static bool letterValidator(String? value) {
    final count = value?.split(" ").length;
    return (alphabetic.hasMatch(value ?? '') && count! <=2 ) ? true : false;
  } //El campo solo puede contener letras

  static bool numbersLettersValidator(String? value) {
  return (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value ?? '')) 
    ? true : false; 
}


  static bool telephoneValidator(String? value) {
    return ((value ?? '').length == 10 && e164PhoneNumberRegExp.hasMatch(value ?? ''))
        ? true : false;
  }
}
