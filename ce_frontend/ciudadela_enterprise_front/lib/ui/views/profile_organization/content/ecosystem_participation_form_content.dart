import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/ecosystem_participation_form.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/stage_view_provider.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/other_entity_form.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/simple_toggle_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcosystemParticipationFormContent extends StatelessWidget {
  const EcosystemParticipationFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    final stageViewProvider = Provider.of<StageViewProvider>(context);
    final ecosystemParticipationFormProvider = Provider.of<EcosystemParticipationFormProvider>(context);
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
                      question: 'Fondo Emprender', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.backgroundUndertake=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.backgroundUndertake=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.backgroundUndertake
                    ),
                    SimpleToggleQuestion(
                      question: 'SENNOVA', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.sennova=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.sennova=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.sennova
                    ),
                    SimpleToggleQuestion(
                      question: 'Apps.co', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.appsco=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.appsco=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.appsco
                    ),
                    SimpleToggleQuestion(
                      question: 'Colombia Productiva', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.productiveColombia=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.productiveColombia=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.productiveColombia
                    ),
                    SimpleToggleQuestion(
                      question: 'Aldea Innpulsa', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.innpulsaVillage=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.innpulsaVillage=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.innpulsaVillage
                    ),
                    SimpleToggleQuestion(
                      question: 'Otra entidad', 
                      yesFunction: (){
                        ecosystemParticipationFormProvider.otherEntity=true;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      noFunction: (){
                        ecosystemParticipationFormProvider.otherEntity=false;
                        ecosystemParticipationFormProvider.updateButtonState();
                      },
                      optionController: ecosystemParticipationFormProvider.otherEntity,
                      extendedAnswer: true,
                      extendedQuestion: const OtherEntityForm(),
                    ),
                    const SizedBox(height: 30),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: CustomOutlinedButton(
                        horizontalPadding: 125,
                        verticalPadding: 10,
                        isEnabled: ecosystemParticipationFormProvider.isValid,
                        onPressed: (){
                          final isValid = ecosystemParticipationFormProvider.isValid;
                          if(isValid) {
                            stageViewProvider.currentStage++;
                            stageViewProvider.updateWidgetsState();
                          }
                        }, 
                        text: 'Siguiente'
                      )
                    )
                  ]
                )
              ),
            ),
          );
        }
      );
  }

}