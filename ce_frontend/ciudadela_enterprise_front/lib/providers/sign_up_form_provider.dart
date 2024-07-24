import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:flutter/material.dart';

class SignUpFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  String name='';
  String lastname='';
  String username='';
  String email='';
  String password='';
  bool get isValid => ((Validator.emptyValidator(name) && Validator.letterValidator(name)))  
    && (Validator.emptyValidator(lastname) && Validator.letterValidator(lastname))
    && (Validator.emptyValidator(username) && Validator.numbersLettersValidator(username)) 
    && (Validator.emptyValidator(email) && Validator.emailValidator(email)) 
    && (Validator.emptyValidator(password) && Validator.passwordValidator(password));
    
  void updateButtonState() {
    notifyListeners(); // Notify listeners about changes
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }
}