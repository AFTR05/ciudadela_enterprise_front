import 'package:ciudadela_enterprise_front/ui/cards/detail_card.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentProgress extends StatelessWidget {
  final String text;
  final double criteria;
  const ContentProgress({super.key, required this.text, required this.criteria});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: const BoxConstraints(
            maxWidth: 1080,
            minWidth: 300
          ),
      child: DetailCard(
        bottomMargin: 10,
        topMargin: 10,
        height: 96,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pendiente',
                      style: size.width < 469 
                        ? CustomLabels.textSpanLink.copyWith(fontSize: 10) 
                        : CustomLabels.textSpanLink),
                    const SizedBox(height: 10,),
                    Text(
                      text , 
                      style: size.width < 469 
                        ? CustomLabels.whiteW300Size16.copyWith(fontSize: 10) 
                        : CustomLabels.whiteW300Size16,),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.contain , 
                  child: Text(
                    '$criteria Criterio${criteria <= 1 ? '' : 's'}', 
                    style: size.width < 469 
                    ? CustomLabels.text16W400Grey.copyWith(fontSize: 10) 
                    : CustomLabels.text16W400Grey,
                  )
                )
              ],
            )
          ],
        )
      ),
    );
  }
}