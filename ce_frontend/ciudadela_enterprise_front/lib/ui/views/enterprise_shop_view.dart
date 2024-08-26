import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/shop_price_product.dart';
import 'package:flutter/material.dart';

class EnterpriseShopView extends StatelessWidget {
  const EnterpriseShopView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Container(
      height: size.height,
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: size.width<=1845? size.width <= 1650 ? size.width <= 1450 ? size.width <= 1150 ? 50 : 100 : 200 : 300 : 400),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 300),
        initialIndex: 0,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Tienda",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.8),
              labelStyle: CustomLabels.tab16W400White,
              indicatorColor: const Color.fromRGBO(81, 160, 225, 1),
              tabs: const [
                Tab(text: 'Módulos' ),
                Tab(text: 'Valoraciones'),
              ],

            ),
            const Divider(color: Colors.grey),
            // El uso de Expanded aquí es crucial para evitar problemas de tamaño
            const Expanded(
              child: TabBarView(
                children: [
                  ModulosPage(),
                  ValoracionesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ModulosPage extends StatelessWidget {
  const ModulosPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int crossAxisCount = size.width < 625  ? 1 : size.width < 900 ? 2 : size.width < 1250 ? 3 : 4;
    final List<String> productTitles = [
      "Indicadores de Negocio",
      "Información Tributaria y Mercantil",
      "Áreas fundamentales de Valor",
      "Organigrama de Negocio",
      "Entorno Sector Económico",
      "Pares de Negocio",
      "Modelo de Negocio",
      "Caracterización de Procesos",
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, 
        crossAxisSpacing: 4.0, 
        mainAxisSpacing: 4.0, 
        childAspectRatio: 0.75, 
      ), 
      itemCount: productTitles.length,
      itemBuilder: (context, index) {
        return ShopPriceProduct.modulePriceProduct(productTitles[index]);
      },
    );
  }
}

class ValoracionesPage extends StatelessWidget {
  const ValoracionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int crossAxisCount = size.width < 500  ? 1 : size.width < 900 ? 2 : size.width < 1250 ? 3 : 4;
    final List<String> productTitles = [
      "Indicadores de Negocio",
      "Información Tributaria y Mercantil",
      "Áreas fundamentales de Valor",
      "Organigrama de Negocio",
      "Entorno Sector Económico",
      "Pares de Negocio",
      "Modelo de Negocio",
      "Caracterización de Procesos",
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, 
        crossAxisSpacing: 4.0, 
        mainAxisSpacing: 4.0, 
        childAspectRatio: 0.75, 
      ), 
      itemCount: productTitles.length,
      itemBuilder: (context, index) {
        return ShopPriceProduct.valorationPriceProduct(productTitles[index]);
      },
    );
  }

  
}