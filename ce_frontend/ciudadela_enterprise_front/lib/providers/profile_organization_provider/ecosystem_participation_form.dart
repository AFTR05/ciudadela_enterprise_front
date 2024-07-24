import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:flutter/material.dart';

class EcosystemParticipationFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  bool? backgroundUndertake;
  bool? sennova;
  bool? appsco;
  bool? productiveColombia;
  bool? innpulsaVillage;
  bool? otherEntity;
  bool? consultingServices;
  String otherEntityData = '';
  String consultingServicesData = '';

  bool get isValid => ((backgroundUndertake!=null) && (sennova!=null) && (appsco!=null)&& (productiveColombia!=null) && (innpulsaVillage!=null) 
  && ((otherEntity!=null) && (otherEntity==false || (otherEntity==true && Validator.emptyValidator(otherEntityData)))));

  bool get consultingValid => (
    (consultingServices!=null) && 
    (consultingServices==false 
        || 
        (consultingServices==true && Validator.emptyValidator(consultingServicesData))
    )
  );

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }
  
}