import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/ecosystem_participation_form.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/profile_organization_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/stage_view_provider.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/consulting_services_form.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/simple_toggle_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcosystemParticipationFormContentPart2 extends StatelessWidget {
  const EcosystemParticipationFormContentPart2({super.key});

  @override
  Widget build(BuildContext context) {
    final stageViewProvider = Provider.of<StageViewProvider>(context);
    final ecosystemParticipationFormProvider = Provider.of<EcosystemParticipationFormProvider>(context);
    final organizationProvider = Provider.of<ProfileOrganizationProvider>(context);
    return Builder(
        builder: (context) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 384
              ),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 25),
                    SimpleToggleQuestion(
                      question: 'Ha contratado servicios de consultoría o acompañamiento empresarial de manera particular?', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.consultingServices=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.consultingServices=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.consultingServices,
                      extendedAnswer: true,
                      extendedQuestion: const ConsultingServicesForm(),
                      
                    ),
                    const SizedBox(height: 30),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: CustomOutlinedButton(
                        horizontalPadding: 125,
                        verticalPadding: 10,
                        isEnabled: ecosystemParticipationFormProvider.consultingValid,
                        onPressed: (){
                          final isValid = ecosystemParticipationFormProvider.consultingValid;
                          if(isValid) {
                            stageViewProvider.updateWidgetsState();
                          }
                          onFormSubmit(ecosystemParticipationFormProvider, organizationProvider,context);
                        }, 
                        text: 'Siguiente'
                      )
                    )
                  ],
                )
              ),
            ),
          );
        }
      );
  }

  void onFormSubmit(EcosystemParticipationFormProvider ecosystemParticipationFormProvider,
  ProfileOrganizationProvider organizationProvider, BuildContext context){
  
    final isValid = ecosystemParticipationFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      // organizationProvider.guardarParticipacionEcosistema(
      //                               ecosystemParticipationFormProvider.backgroundUndertake!, 
      //                               ecosystemParticipationFormProvider.sennova!, 
      //                               ecosystemParticipationFormProvider.appsco!,
      //                               ecosystemParticipationFormProvider.productiveColombia!,
      //                               ecosystemParticipationFormProvider.innpulsaVillage!,
      //                               ecosystemParticipationFormProvider.otherEntityData,
      //                               ecosystemParticipationFormProvider.consultingServices!,
      //                               ecosystemParticipationFormProvider.consultingServicesData
      //                             );
    }     
    Navigator.of(context).pop(); // Cierra el diálogo        
  }
}