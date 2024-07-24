import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:flutter/material.dart';

class GeneralInformationFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  String direction = '';
  String telephone = '';
  String email = '';
  bool get isValid => (Validator.emailValidator(email) && Validator.emptyValidator(email)) && 
  Validator.emptyValidator(direction) && 
  (Validator.emptyValidator(telephone) && Validator.telephoneValidator(telephone));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }
  
}