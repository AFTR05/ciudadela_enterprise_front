import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_navigation_button.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOrganizationBeginView extends StatelessWidget {
  const ProfileOrganizationBeginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.6,
      margin: const EdgeInsets.only(bottom: 80,top: 30),
      padding: const EdgeInsets.symmetric( horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          SizedBox(height: size.height*0.02),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 384
              ),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text( 
                      'Comienza aquí',  // todo hacer que lea quien se inicio con el localstorage
                      style: CustomLabels.title32W400White
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Para perfilar tu organización y tener\nun primer acercamiento, sugerimos que\n inicies con el siguiente  módulo",
                        style: CustomLabels.subtitle20W200White
                      ),
                    ),
                  const SizedBox(height: 40),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(55, 57, 63,1),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      width: 392,
                      height: 144,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Perfil Básico Organizacional",
                              style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: CustomOutlinedButton( 
                              verticalPadding: 10,
                              horizontalPadding: 20,
                              onPressed: (){
                                Navigator.pushNamed(context, Flurorouter.creationOrganization);
                              }, 
                              text: 'Comenzar módulo'
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              
              ),
            )
          ),
        ],
      ),
    );
  }
}