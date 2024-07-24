import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/organization_state_form_provider.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_dropdown_input_menu.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakevenForm extends StatelessWidget {
  const BreakevenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final organizationStateFormProvider = Provider.of<OrganizationStateFormProvider>(context);
        
    return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 352
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                const SizedBox(height: 25),
                TextFormField( 
                  onChanged: (value){
                    organizationStateFormProvider.breakevenData!.complianceStrategy=value;
                    organizationStateFormProvider.updateButtonState();
                  },
                  maxLines: null,
                  validator: (value){
                    return !Validator.emptyValidator(value)
                                ? 'El campo no puede estar vacío'
                                : null;
                  },
                  style: CustomLabels.whiteW300Size16,
                  decoration: CustomInput.inputDecoration(hint: 'Ingresa tu Estrategia de cumplimiento', label: 'Estrategia de cumplimiento'),
                ),
                const SizedBox(height: 25),
                CustomDropdownInputMenu(
                  onSelectedOptionChanged: (selectedOption) {
                    organizationStateFormProvider.breakevenData!.achieveTime = selectedOption;
                    organizationStateFormProvider.updateButtonState();
                  },
                  options: const [
                    'Antes de 6 meses',
                    'Entre 6 y 12 meses',
                    'Entre 13 y 18 meses',
                    'Entre 19 y 24 meses'
                    ], 
                  label: 'Tiempo de meta:'
                )
              ]
            )
          ),
        ),
      );
  }
}
