import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/providers/sign_up_form_provider.dart';
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

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_)=>SignUpFormProvider(),
      child: Builder(
        builder: (context){
          final size = MediaQuery.of(context).size;
          final signUpFormProvider = Provider.of<SignUpFormProvider>(context);
          return Container(
            width: size.width,
            margin: const EdgeInsets.only(bottom: 80,top: 80),
            padding: const EdgeInsets.symmetric( horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 384
                ),
                child: Form(
                  key: signUpFormProvider.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Únete hoy',
                          style: CustomLabels.title32W400White,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Impulsa el crecimiento de tu organización',
                          style: CustomLabels.subtitle20W200White,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider, context),
                        onChanged: (value) {
                          signUpFormProvider.name = value;
                          signUpFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : !Validator.letterValidator(value)
                                  ? 'El campo solo puede contener letras y solo 2 nombres'
                                  : null;
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(hint: 'Ingresa tus nombres', label: 'Nombres'),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider, context),
                        onChanged: (value) {
                          signUpFormProvider.lastname = value;
                          signUpFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : !Validator.letterValidator(value)
                                  ? 'El campo solo puede contener letras y solo 2 apellidos'
                                  : null;
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(hint: 'Ingresa tus apellidos', label: 'Apellidos'),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider, context),
                        onChanged: (value) {
                          signUpFormProvider.username = value;
                          signUpFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return !Validator.emptyValidator(value)
                              ? 'El campo no puede estar vacío'
                              : !Validator.numbersLettersValidator(value)
                                  ? 'El campo solo puede contener letras y números'
                                  : null;
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(hint: 'Ingresa tu usuario', label: 'Nombre de usuario'),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider, context),
                        onChanged: (value) {
                          signUpFormProvider.email = value;
                          signUpFormProvider.updateButtonState();
                        },
                        validator: (value) {
                          return Validator.emailValidator(value) ? null : 'Email no valido';
                        },
                        style: CustomLabels.whiteW300Size16,
                        decoration: CustomInput.inputDecoration(hint: 'Ingresa tu correo', label: 'Correo'),
                      ),
                      const SizedBox(height: 15),
                      PasswordInput(
                        onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider, context),
                        onChanged: (value) {
                          signUpFormProvider.password = value;
                          signUpFormProvider.updateButtonState();
                        },
                      ),
                      const SizedBox(height: 40),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CustomOutlinedButton(
                          horizontalPadding: 125,
                          verticalPadding: 10,
                          isEnabled: signUpFormProvider.isValid,
                          onPressed: () => onFormSubmit(signUpFormProvider, authProvider, context),
                          text: 'Registrarme',
                        ),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '¿Tienes una cuenta? ',
                                style: CustomLabels.textSpanBasic,
                              ),
                              TextSpan(
                                text: 'Inicia sesión',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Al registrarte, aceptas nuestros ',
                                style: CustomLabels.textSpanBasic,
                              ),
                              TextSpan(
                                text: 'Términos y Condiciones ',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(
                                text: 'y\nnuestra política de ',
                                style: CustomLabels.textSpanBasic,
                              ),
                              TextSpan(
                                text: 'Protección de datos.',
                                style: CustomLabels.textSpanLink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          );
        }
      ),
    );
  }

  void onFormSubmit(SignUpFormProvider signUpFormProvider, AuthProvider authProvider, BuildContext context) {
  final isValid = signUpFormProvider.validateForm();
  if (isValid) {
    NotificationsService.showBusyIndicator(context);
    authProvider.register(
      signUpFormProvider.name,
      signUpFormProvider.lastname,
      signUpFormProvider.username,
      signUpFormProvider.email,
      signUpFormProvider.password
    );
  }
}


}