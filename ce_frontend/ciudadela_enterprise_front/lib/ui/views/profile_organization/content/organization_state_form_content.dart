import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/organization_state_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/profile_organization_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/stage_view_provider.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/breakeven_form.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/oportunity_profile_form.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/simple_toggle_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationStateFormContent extends StatelessWidget {
  const OrganizationStateFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    final stageViewProvider = Provider.of<StageViewProvider>(context);
    
    final organizationProvider = Provider.of<ProfileOrganizationProvider>(context);
    return ChangeNotifierProvider(
      create: (_)=>OrganizationStateFormProvider(),
      child: Builder(
        builder: (context) {
          final organizationStateFormProvider = Provider.of<OrganizationStateFormProvider>(context);
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 384
              ),
              child: Form(
                key: organizationStateFormProvider.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 25),
                    SimpleToggleQuestion(
                      question: '¿La organización está constituida\nformalmente ante la cámara de comercio?', 
                      yesFunction: (){
                        organizationStateFormProvider.commerceChamber=true;
                        organizationStateFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        organizationStateFormProvider.commerceChamber=false;
                        organizationStateFormProvider.updateButtonState();
                      },
                      optionController: organizationStateFormProvider.commerceChamber
                    ),
                    SimpleToggleQuestion(
                      question: '¿La organización encuentra en\npunto de equilibrio?', 
                      yesFunction: (){
                        organizationStateFormProvider.breakeven=true;
                        organizationStateFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        organizationStateFormProvider.breakeven=false;
                        organizationStateFormProvider.updateButtonState();
                      },
                      optionController: organizationStateFormProvider.breakeven,
                      extendedAnswer: false,
                      extendedQuestion: const BreakevenForm(),
                    ),
                    SimpleToggleQuestion(
                      question: '¿En su equipo cuenta con un perfil dedicado a\nidentificar la oportunidad de negocio, el\ndesarrollo del mismo y su escalabilidad?', 
                      yesFunction: (){
                        organizationStateFormProvider.oportunityProfile=true;
                        organizationStateFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        organizationStateFormProvider.oportunityProfile=false;
                        organizationStateFormProvider.updateButtonState();
                      },
                      optionController: organizationStateFormProvider.oportunityProfile,
                      extendedAnswer: true,
                      extendedQuestion: const OportunityProfileForm(),
                    ),
                    const SizedBox(height: 30),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: CustomOutlinedButton(
                        horizontalPadding: 125,
                        verticalPadding: 10,
                        isEnabled: organizationStateFormProvider.isValid,
                        onPressed: (){
                          final isValid = organizationStateFormProvider.isValid;
                          if(isValid) {
                            stageViewProvider.currentStage++;
                            stageViewProvider.progress+= 1/3;
                            stageViewProvider.updateWidgetsState();
                          }
                          onFormSubmit(organizationStateFormProvider, organizationProvider,context);
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
      ),
    );
  }


  void onFormSubmit(OrganizationStateFormProvider organizationStateFormProvider,
  ProfileOrganizationProvider organizationProvider, BuildContext context){
  
    final isValid = organizationStateFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      // organizationProvider.guardarEstadoOrganizacion(
      //                               organizationStateFormProvider.breakeven!, 
      //                               organizationStateFormProvider.breakevenData!.complianceStrategy, 
      //                               organizationStateFormProvider.breakevenData!.achieveTime,
      //                               organizationStateFormProvider.commerceChamber!,
      //                               organizationStateFormProvider.oportunityProfile!,
      //                               organizationStateFormProvider.oportunityProfileData!.name,
      //                               organizationStateFormProvider.oportunityProfileData!.email,
      //                               organizationStateFormProvider.oportunityProfileData!.telephone
      //                             );
    }             
    Navigator.of(context).pop(); // Cierra el diálogo
  }
}