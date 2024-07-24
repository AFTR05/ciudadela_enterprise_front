
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:flutter/material.dart';

class BreakevenQuestion{
  String complianceStrategy;
  String achieveTime;
  BreakevenQuestion(this.complianceStrategy,this.achieveTime);
}

class OportunityProfile{
  String telephone;
  String name;
  String email;
  OportunityProfile(this.telephone,this.name,this.email);
}

class OrganizationStateFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  bool? commerceChamber;
  bool? breakeven;
  bool? oportunityProfile;
  BreakevenQuestion? breakevenData;
  OportunityProfile? oportunityProfileData;
  bool get isValid => (
                        commerceChamber != null &&
                        (
                          (breakeven != null) &&
                          (
                            breakeven == true ||
                            (
                              breakeven == false &&
                              Validator.emptyValidator(breakevenData!.achieveTime) &&
                              Validator.emptyValidator(breakevenData!.complianceStrategy)
                            )
                          )
                        ) &&
                        (
                          (oportunityProfile != null) &&
                          (
                            oportunityProfile == false ||
                            (
                              oportunityProfile == true &&
                              (Validator.emailValidator(oportunityProfileData!.email) 
                              && Validator.emptyValidator(oportunityProfileData!.email)) &&
                              (Validator.letterValidator(oportunityProfileData!.name) &&
                              Validator.emptyValidator(oportunityProfileData!.name)) &&
                              (Validator.telephoneValidator(oportunityProfileData!.telephone)&& 
                              Validator.emptyValidator(oportunityProfileData!.telephone))
                            )
                          )
                        )
                      );


  OrganizationStateFormProvider(){
    breakevenData = BreakevenQuestion('', '');
    oportunityProfileData = OportunityProfile('', '', '');
  }

  void updateButtonState() {
    notifyListeners(); 
  }
  
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }
}

