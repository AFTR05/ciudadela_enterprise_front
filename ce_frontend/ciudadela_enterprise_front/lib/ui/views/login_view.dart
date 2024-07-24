
import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/providers/login_form_provider.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/notifications_service.dart';
import 'package:ciudadela_enterprise_front/services/validator.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/custom_input.dart';
import 'package:ciudadela_enterprise_front/ui/inputs/password_input.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_)=>LoginFormProvider(),
      child: Builder(
        builder: (context){
          final loginFormProvider = Provider.of<LoginFormProvider>(context);
          return Container(
            margin: const EdgeInsets.only(bottom: 80,top: 80),
            padding: const EdgeInsets.symmetric( horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 384,
                ),
                child: Form(
                  key: loginFormProvider.formkey,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Bienvenido de vuelta',
                          style: CustomLabels.title32W400White
                        ),
                      ),
                      const SizedBox(height: 10),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Impulsa el crecimiento de tu organización',
                          style: CustomLabels.subtitle20W200White
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField( 
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider,context),
                        onChanged: (value){
                          loginFormProvider.email=value;
                          loginFormProvider.updateButtonState();
                        },
                        validator: (value){
                          return Validator.emailValidator(value)
                              ? null
                              : 'Email no valido';
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(hint: 'Ingresa tu correo', label: 'Correo'),
                      ),
                      const SizedBox(height: 20),
                      PasswordInput(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider,context),
                        onChanged: (value){
                          loginFormProvider.password=value;
                          loginFormProvider.updateButtonState();
                          }
                      ),
                      const SizedBox(height: 40),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CustomOutlinedButton(
                          horizontalPadding: 125,
                          verticalPadding: 10,
                          isEnabled: loginFormProvider.isValid,
                          onPressed: () => onFormSubmit(loginFormProvider, authProvider,context), 
                          text: 'Iniciar Sesión'
                        )
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: RichText(
                          text: TextSpan(
                            text: 'Olvidé mi contraseña',
                            style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    
                                  }
                          )
                        ),
                      )
                      ,
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '¿Aún no tienes una cuenta? ',
                                style: CustomLabels.textSpanBasic
                              ),
                              TextSpan(
                                text: 'crea una acá',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, Flurorouter.signUpRoute);
                                  }
                              )
                            ],
                          )
                        ),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Al iniciar sesión, estás aceptando nuestros ',
                                style: CustomLabels.textSpanBasic
                              ),
                              TextSpan(
                                text: 'Términos y\nCondiciones ',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    
                                  }
                              ),
                              TextSpan(
                                text: 'y nuestra política de ',
                                style: CustomLabels.textSpanBasic
                              ),
                              TextSpan(
                                text: 'Protección de datos.',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    
                                  }
                              ),
                            ],
                          )
                        ),
                      ),                     
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      )
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider,AuthProvider authProvider,BuildContext context){
    final isValid = loginFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
                    
  }
}