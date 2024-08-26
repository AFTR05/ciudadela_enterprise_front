import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/services/navigation_service.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/progress_bar_product.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/shop_price_product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterpriseOwnModulesView extends StatelessWidget {
  const EnterpriseOwnModulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: size.width<=1845? size.width <= 1650 ? size.width <= 1450 ? size.width <= 1150 ? 50 : 100 : 200 : 300 : 400),
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
                      NavigationService.navigateTo(Flurorouter.enterpriseResume);
                    }
                ),
                TextSpan(
                  text: '    |   Resumen  / ',
                  style: CustomLabels.tab16W400White,
                )
                ,
                TextSpan(
                  text: ' Mis Módulos',
                  style: CustomLabels.text16W400Grey
                )
              ],
            )
          ),
          const SizedBox(height: 30),
          buildModulesSection(),
          const SizedBox(height: 30),
          buildSuggestionsSection()
        ],
      ),
    );
  }
}


Widget buildModulesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mis Módulos", style: CustomLabels.title32W400White),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: [
              ProgressBarProduct.moduleProgressBarProduct("Perfil Básico Organizacional"),
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

Widget buildSuggestionsSection() {
    final List<String> productTitles = [
      "Indicadores de Negocio",
      "Información Tributaria y Mercantil",
      "Áreas fundamentales de Valor",
      "Organigrama de Negocio"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nuestras sugerencias para ti", style: CustomLabels.subtitle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: productTitles.map((title) {
              return ShopPriceProduct.modulePriceProduct(title);
            }).toList(),
          ),
        ),
      ],
    );
}