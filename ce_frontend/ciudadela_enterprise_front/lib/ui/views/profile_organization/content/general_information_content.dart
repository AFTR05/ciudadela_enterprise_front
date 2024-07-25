import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/general_information_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/profile_organization_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/stage_view_provider.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralInformationFormContent extends StatelessWidget {
  const GeneralInformationFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    final stageViewProvider = Provider.of<StageViewProvider>(context);
    
    return ChangeNotifierProvider(
        create: (_) => GeneralInformationFormProvider(),
        child: Builder(builder: (context) {
          final generalInformationFormProvider =
              Provider.of<GeneralInformationFormProvider>(context);
          final organizationProvider = Provider.of<ProfileOrganizationProvider>(context);
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 384),
              child: Form(
                  key: generalInformationFormProvider.formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          generalInformationFormProvider.telephone = value;
                          generalInformationFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return Validator.telephoneValidator(value)
                              ? null
                              : 'Teléfono no valido';
                        },
                        style:CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(
                            hint: 'Ingresa tu teléfono', label: 'Teléfono'),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          generalInformationFormProvider.email = value;
                          generalInformationFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return Validator.emailValidator(value)
                              ? null
                              : 'Email no valido';
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(
                            hint: 'Ingresa tu correo', label: 'Correo'),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          generalInformationFormProvider.direction = value;
                          generalInformationFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : null;
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(
                            hint: 'Ingresa tu dirección', label: 'Dirección'),
                      ),
                      const SizedBox(height: 40),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: CustomOutlinedButton(
                              horizontalPadding: 125,
                              verticalPadding: 10,
                              isEnabled: generalInformationFormProvider.isValid,
                              onPressed: () {
                                final isValid = generalInformationFormProvider
                                    .validateForm();
                                if (isValid) {
                                  stageViewProvider.currentStage++;
                                  stageViewProvider.progress += 1 / 3;
                                  stageViewProvider.updateWidgetsState();
                                }
                                onFormSubmit(generalInformationFormProvider, organizationProvider,context);
                              },
                              text: 'Siguiente'))
                    ],
                  )),
            ),
          );
        }));
  }

  void onFormSubmit(GeneralInformationFormProvider generalInformationFormProvider,
  ProfileOrganizationProvider organizationProvider, BuildContext context){
  
    final isValid = generalInformationFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      // organizationProvider.guardarInformacionGeneral(
      //                               generalInformationFormProvider.email, 
      //                               generalInformationFormProvider.direction, 
      //                               generalInformationFormProvider.telephone
      //                             );
    }    
    Navigator.of(context).pop(); // Cierra el diálogo
  }
}

