import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/buy_now_button.dart';
import 'package:ciudadela_enterprise_front/ui/cards/enterprise_card.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ShopPriceProduct extends StatelessWidget {
  
  final IconData icon;
  final String text;

  const ShopPriceProduct({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return EnterpriseCard(
      width: 230,
      height: 320,
      icon: icon,
      title: text,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text.length < 22 ? const SizedBox(height: 26) : Container(),
          RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\$100.000 COP',
                                    style: CustomLabels.textLineThrough
                                  ),
                                  TextSpan(
                                    text: '  20% OFF\n\n',
                                    style: CustomLabels.textSpanLink,
                                  ),
                                  TextSpan(
                                    text: '\$80.000 COP',
                                    style: CustomLabels.textPrice
                                  )
                                ],
                              )
                            ),
          const SizedBox(height: 20),
          Center(child: ActionCardButton(onPressed: (){}, text: "Comprar ahora", horizontalPadding: 20.0))
        ],
      ),
    );
  }

  static ShopPriceProduct modulePriceProduct(String text) {
    return ShopPriceProduct(icon: Ionicons.extension_puzzle_outline, text: text);
  }

  static ShopPriceProduct valorationPriceProduct(String text) {
    return  ShopPriceProduct(icon: BootstrapIcons.box, text: text);
  }
}