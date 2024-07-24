import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:flutter/material.dart';

class CreateChannelFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();

  String name = '';
  String description = '';
  bool get isValid => (Validator.emptyValidator(name) && Validator.numbersLettersValidator(name)) 
  && (Validator.emptyValidator(description));

  void updateButtonState() {
    notifyListeners(); // Notify listeners about changes
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }
}