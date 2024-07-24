
import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/providers/create_channel_form_provider.dart';
import 'package:ciudadela_enterprise_front/providers/organization_provider.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_navigation_button.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewChannelView extends StatelessWidget {
  const NewChannelView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final organizationProvider = Provider.of<OrganizationProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_)=>CreateChannelFormProvider(),
      child: Builder(
        builder: (context){
          final createChannelFormProvider = Provider.of<CreateChannelFormProvider>(context);
          return Container(
            width: size.width,
            margin: const EdgeInsets.only(bottom: 80,top: 30),
            padding: const EdgeInsets.symmetric( horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: CustomNavigationButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Flurorouter.channelRoute);
                        }, 
                        text: 'Volver',
                        verticalPadding: 10,
                        horizontalPadding: 5
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: CustomNavigationButton(
                        onPressed: (){}, 
                        text: 'Salir',
                        verticalPadding: 10,
                        horizontalPadding: 5
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height*0.06),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 384
                    ),
                    child: Form(
                      key: createChannelFormProvider.formkey,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Nuevo Canal',
                              style: CustomLabels.title32W400White
                            ),
                          ),
                          const SizedBox(height: 10),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Fortalece las capacidades de tu organización',
                              style: CustomLabels.subtitle20W200White
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField( 
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onFieldSubmitted: (_)=>onFormSubmit(
                                createChannelFormProvider,
                                organizationProvider, 
                                authProvider, 
                                context
                            ), 
                            onChanged: (value){
                              createChannelFormProvider.name=value;
                              createChannelFormProvider.updateButtonState();
                            },
                            validator: (value){
                              return !Validator.emptyValidator(value)
                                ? 'El campo no puede estar vacío'
                                : !Validator.numbersLettersValidator(value)
                                  ? 'El campo solo puede contener letras y números'
                                  : null;

                            },
                            style: CustomLabels.whiteW300Size16,
                            decoration: CustomInput.inputDecoration(
                              hint: 'Ingresa el nombre de la organización'
                              , label: 'Nombre'
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField( 
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onFieldSubmitted: (_)=>onFormSubmit(
                                createChannelFormProvider,
                                organizationProvider, 
                                authProvider, 
                                context
                            ), 
                            onChanged: (value){
                              createChannelFormProvider.description=value;
                              createChannelFormProvider.updateButtonState();
                            },
                            validator: (value){
                              return !Validator.emptyValidator(value)
                                ? 'El campo no puede estar vacío'
                                : null;
                            },
                            maxLines: null,
                            style: CustomLabels.whiteW300Size16,
                            decoration: CustomInput.inputDecoration(
                              hint: 'Ingresa una descripción de la organización'
                              , label: 'Descripción'
                            ),
                          ),
                          const SizedBox(height: 30),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: CustomOutlinedButton(
                              horizontalPadding: 125,
                              verticalPadding: 10,
                              isEnabled: createChannelFormProvider.isValid,
                              onPressed: (){onFormSubmit(
                                createChannelFormProvider,
                                organizationProvider, 
                                authProvider, 
                                context
                              );
                              Navigator.pushNamed(context, Flurorouter.organizationProfileRoute);
                              } 
                              ,
                              text: 'Crear canal'
                            )
                          )                     
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }

  void onFormSubmit(CreateChannelFormProvider createChannelFormProvider,
  OrganizationProvider organizationProvider, 
  AuthProvider authProvider,BuildContext context){
    final isValid = createChannelFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      organizationProvider.createOrganization(
        createChannelFormProvider.name, 
        createChannelFormProvider.description,
        authProvider.user.email
      );
    }             
  }
}