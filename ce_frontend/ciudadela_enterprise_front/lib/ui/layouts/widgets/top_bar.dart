import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/layouts/widgets/content/navigation_menu.dart';
import 'package:flutter/material.dart';

class TopBar {
  FittedBox basicTop() {
    return FittedBox(
      fit: BoxFit.contain,      
      child: Text(
                'Enterprise',
                style: CustomLabels.enterpriseTitle,
              ),
    );
  }

  Row enterpriseMain(bool isNavigated){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
                'Enterprise',
                style: CustomLabels.enterpriseTitle,
              ),
        ),
        isNavigated ? const NavigationMenu() : Container(),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            children: [
              Icon(Icons.bubble_chart_outlined,color: Colors.white.withOpacity(0.6), size: 25,),
              const SizedBox(width: 5,),
              Text(
                'MirusSmart',
                style: CustomLabels.whiteW200Size16,
              )
            ]
          ),
        )
      ],
    );
  }
}