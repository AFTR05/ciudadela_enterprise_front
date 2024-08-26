import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/content_progress.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/detail_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnterpriseModuleDetailsView extends StatelessWidget {
  const EnterpriseModuleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: size.width<=1845? size.width <= 1650 ? size.width <= 1450 ? size.width <= 1150 ? 50 : 100 : 200 : 300 : 400),
      child: SingleChildScrollView(

          scrollDirection: Axis.vertical, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Volver',
                    style: CustomLabels.tab16W400White,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        NavigationService.navigateTo(Flurorouter.enterpriseResumeOwnModules);
                      }
                  ),
                  TextSpan(
                    text: '    |   Resumen  / ',
                    style: CustomLabels.tab16W400White,
                  ),
                  TextSpan(
                    text: ' Mis Módulos  / ',
                    style: CustomLabels.tab16W400White,
                  ),
                  TextSpan(
                    text: ' Perfil Básico Organizacional  ',
                    style: CustomLabels.text16W400Grey
                  )
                ],
              )
            ),
            const SizedBox(height: 30),
            buildProgressSection(),
            const SizedBox(height: 20),
            buildContentSection(size.width),
          ]
        ),
      ),
    );

  }
}

Widget buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(fit: BoxFit.contain, child: Text("Perfil Básico Organizacional", style: CustomLabels.title32W400White)),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: [
              DetailProgress(text: "Componentes completados", totalProgress: 3, currentProgress: 3),
              DetailProgress(text: "Criterios completados", totalProgress: 13, currentProgress: 13)
            ],
          ),
        ),
        
      ],
    );
}

Widget buildContentSection(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(fit: BoxFit.contain,child: Text("Contenido", style: CustomLabels.subtitle)),
        const SizedBox(height: 20,),
        Text("3 Componentes · 13 Criterios", style: CustomLabels.text16W400Grey),
        const SizedBox(height: 10,),
        const SingleChildScrollView(
          scrollDirection: Axis.vertical, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContentProgress(text: "Estado de la organización", criteria:  3),
              ContentProgress(text: "Estado de la organización", criteria:  3),
              ContentProgress(text: "Participación en el ecosistema", criteria:  7),
            ],
          ),
        ),
      ],
    );
}