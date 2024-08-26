import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/buy_now_button.dart';
import 'package:ciudadela_enterprise_front/ui/cards/enterprise_card.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class ProgressBarProduct extends StatelessWidget {
  
  final IconData icon;
  final String text;
  final double progress;

  const ProgressBarProduct({super.key, required this.icon, required this.text, required this.progress});

  @override
  Widget build(BuildContext context) {
    return EnterpriseCard(
      width: 220,
      height: 290,
      icon: icon,
      title: text,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          text.length < 22 ? const SizedBox(height: 26) : Container(),
          text.length < 53 ? const SizedBox(height: 10) : Container()
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Progreso", style: CustomLabels.progressStyle),
              Text("${progress*100}%", style: CustomLabels.progressStyle)
            ],
          ),
          const SizedBox(height: 4,),
          SizedBox(width: 200,  child: ProgressBarWidget(progress: progress)),
          const SizedBox(height: 15),
          Center(child: ActionCardButton(onPressed: (){}, text: "Ver detalles", horizontalPadding: 20.0))
        ],
      ),
    );
  }

  static ProgressBarProduct moduleProgressBarProduct(String text) {
    return ProgressBarProduct(icon: Ionicons.extension_puzzle_outline, text: text, progress: 1.0,);
  }

  static ProgressBarProduct valorationProgressBarProduct(String text) {
    return  ProgressBarProduct(icon: BootstrapIcons.box, text: text, progress: 0.0,);
  }
}