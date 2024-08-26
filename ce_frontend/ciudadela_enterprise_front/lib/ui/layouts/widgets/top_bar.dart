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

  Row enterpriseSecondary(){
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


  Widget enterpriseMain(int defaultNavigation){
    return LayoutBuilder(
      builder:(context, constraints) {
        final size = MediaQuery.of(context).size;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            size.width <= 700 ? Container()
            : Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                    'Enterprise',
                    style: CustomLabels.enterpriseTitle,
                  ),
            ),
            NavigationMenu(defaultSelectedButton: defaultNavigation),
            size.width <= 700 ? Container()
            : Padding(
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
      },
    );

    
  }
}