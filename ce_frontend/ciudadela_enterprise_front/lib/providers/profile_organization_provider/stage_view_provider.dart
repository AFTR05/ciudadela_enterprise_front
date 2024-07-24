import 'package:ciudadela_enterprise_front/ui/views/profile_organization/content/ecosystem_participation_form_content.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/content/ecosystem_participation_form_content_part_2.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/content/general_information_content.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/content/organization_state_form_content.dart';
import 'package:flutter/material.dart';

enum OrganizationProfileStage{
  generalInfo,
  organizationState,
  ecosystemParticipation,
}

extension OrganizationProfileStageDescription on OrganizationProfileStage{
  String get description{
    switch (this){
      case OrganizationProfileStage.generalInfo:
        return "Información general";
      case OrganizationProfileStage.organizationState:
        return "Estado de la organización";
      case OrganizationProfileStage.ecosystemParticipation:
        return "Participación en el ecosistema";
    }
  }
}


class StageViewProvider extends ChangeNotifier{

  int currentStage = 1;
  double progress = 1/3;

  String getCurrentDescription(){
    switch (currentStage){
      case 1:
        return OrganizationProfileStage.generalInfo.description;
      case 2:
        return OrganizationProfileStage.organizationState.description;
      case 3:
        return OrganizationProfileStage.ecosystemParticipation.description;
      case 4:
        return OrganizationProfileStage.ecosystemParticipation.description;
      default:
        return '';
    }
  }
  //todo method that return forms depending on the current stage variable

  void updateWidgetsState() {
    notifyListeners();
  }

  Widget getOrganizationProfileContent(){
    switch (currentStage){
      case 1:
        return const GeneralInformationFormContent();
      case 2:
        return const OrganizationStateFormContent();
      case 3:
        return const EcosystemParticipationFormContent();
      case 4: 
        return const EcosystemParticipationFormContentPart2();
      default:
        return const GeneralInformationFormContent();
    }
  }

}