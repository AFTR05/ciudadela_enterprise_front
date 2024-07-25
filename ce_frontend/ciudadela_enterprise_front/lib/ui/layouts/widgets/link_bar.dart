import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({super.key});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromRGBO(55, 57, 63, 1),
      height: (size.width>1000)?size.height * 0.08:null,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Powered by MirusSmart',
            style: CustomLabels.whiteW200Size16,
          ),
        ),
      )
    );
  }
}