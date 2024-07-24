
import 'package:ciudadela_enterprise_front/providers/auth_provider.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_navigation_button.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_outlined_button.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {

    
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user= Provider.of<AuthProvider>(context).user;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 80,top: 30),
      padding: const EdgeInsets.symmetric( horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomNavigationButton(
                onPressed: (){}, 
                text: 'Salir',
                verticalPadding: 10,
                horizontalPadding: 5
              )
            ],
          ),
          SizedBox(height: size.height*0.15),
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
                      'Hola ${user.firstName}',   
                      style: CustomLabels.title32W400White
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Aquí comenzamos un camino juntos. Ahora\ncrea una cuenta para tu organización',
                        style: CustomLabels.whiteW300Size16
                      ),
                    ),
                  const SizedBox(height: 40),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: CustomOutlinedButton( 
                      verticalPadding: 10,
                      horizontalPadding: 20,
                      onPressed: (){
                        Navigator.pushNamed(context, Flurorouter.creationChannelRoute);
                      }, 
                      text: 'Nuevo canal'
                    )
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