import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/organization_state_form_provider.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OportunityProfileForm extends StatelessWidget {
  const OportunityProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final organizationStateFormProvider = Provider.of<OrganizationStateFormProvider>(context);
        
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 352
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextFormField( 
                onChanged: (value){
                  organizationStateFormProvider.oportunityProfileData!.telephone=value;
                  organizationStateFormProvider.updateButtonState();
                },
                validator: (value){
                  return Validator.telephoneValidator(value)
                          ? null
                          : 'Teléfono no valido';
                },
                style: CustomLabels.whiteW300Size16,
                decoration: CustomInput.inputDecoration(hint: 'Ingresa tu teléfono de contacto', label: 'Teléfono de contacto'),
              ),
              const SizedBox(height: 25),
              TextFormField( 
                onChanged: (value){
                  organizationStateFormProvider.oportunityProfileData!.name=value;
                  organizationStateFormProvider.updateButtonState();
                },
                validator: (value){
                  return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : !Validator.letterValidator(value)
                                ? 'El campo solo puede contener letras'
                                : null;
                },
                style: CustomLabels.whiteW300Size16,
                decoration: CustomInput.inputDecoration(hint: 'Ingresa el nombre de contacto', label: 'Nombre'),
              ),
              const SizedBox(height: 25),
              TextFormField( 
                onChanged: (value){
                  organizationStateFormProvider.oportunityProfileData!.email=value;
                  organizationStateFormProvider.updateButtonState();
                },
                validator: (value){
                  return Validator.emailValidator(value)
                            ? null
                            : 'Email no valido';
                },
                style: CustomLabels.whiteW300Size16,
                decoration: CustomInput.inputDecoration(hint: 'Ingresa tu correo', label: 'Correo'),
                ),
                const SizedBox(height: 25),
            ]
          )
        ),
      ),
    );
  }
}