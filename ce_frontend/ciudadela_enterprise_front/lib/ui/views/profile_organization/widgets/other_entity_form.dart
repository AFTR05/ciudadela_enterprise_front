import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/ecosystem_participation_form.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherEntityForm extends StatelessWidget {
  const OtherEntityForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ecosystemParticipationFormProvider = Provider.of<EcosystemParticipationFormProvider>(context);
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
                    ecosystemParticipationFormProvider.otherEntityData=value;
                    ecosystemParticipationFormProvider.updateButtonState();
                  },
                  validator: (value){
                    return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : null;
                  },
                  style: CustomLabels.whiteW300Size16,
                  decoration: CustomInput.inputDecoration(hint: 'Ingresa la otra entidad', label: '¿Cuál?'),
                  )
            ]
          )
        ),
      ),
    );
  }
}