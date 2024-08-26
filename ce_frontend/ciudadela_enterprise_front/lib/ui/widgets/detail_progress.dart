import 'package:ciudadela_enterprise_front/ui/cards/detail_card.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/widgets/progress_bar_widget.dart';
import 'package:flutter/material.dart';

class DetailProgress extends StatelessWidget {
  final String text;
  final double totalProgress;
  final double currentProgress;
  const DetailProgress({super.key, required this.text, required this.totalProgress, required this.currentProgress});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return DetailCard(
      width: 282,
      height: 128,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: size.width < 500 ? CustomLabels.tab18W400White.copyWith(fontSize: 14) : CustomLabels.tab18W400White),
          size.width < 500 ? const SizedBox(height: 8) : Container(),
          Text("$currentProgress de $totalProgress" , style: size.width < 500 ? CustomLabels.title32W400White.copyWith(fontSize: 25) : CustomLabels.title32W400White,),
          const SizedBox(height: 8),
          ProgressBarWidget(progress: currentProgress/totalProgress, heightBar: 8.0)
        ],
      )
    );
  }
}