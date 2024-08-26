import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/progress_bar_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnterpriseResumeView extends StatelessWidget {
  const EnterpriseResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: size.width<=1845? size.width <= 1650 ? size.width <= 1450 ? size.width <= 1150 ? 50 : 100 : 200 : 300 : 400),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Hola Brayam", textAlign: TextAlign.start, style: CustomLabels.title32W400White),
            ],
          ),
          const SizedBox(height: 30),
          buildModulesSection(),
          const SizedBox(height: 30),
          buildValorationsSection()

          
        ],
      ),
    );
  }
}

Widget buildModulesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mis Módulos", style: CustomLabels.subtitle),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  NavigationService.navigateTo(Flurorouter.enterpriseResumeOwnModules);
                },
                child: Text("Ver todo", style: CustomLabels.text14400White)
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: [
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional de Personas con condicio"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional")
            ],
          ),
        ),
      ],
    );
}

Widget buildValorationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mis Valoraciones", style: CustomLabels.subtitle,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(Flurorouter.enterpriseResumeOwnValorations);
                  },
                  child: Text("Ver todo", style: CustomLabels.text14400White)
                ),
              )
            ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: [
              ProgressBarProduct.valorationProgressBarProduct("Madurez base Organizacional")
            ],
          ),
        )
      ],
    );
}