import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {

  final double progress;
  final double heightBar;

  const ProgressBarWidget({super.key, required this.progress , this.heightBar=8.0});

  

  

  @override
  Widget build(BuildContext context) {

    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(8.0),
      minHeight: heightBar,
      value: progress,
      color: const Color.fromRGBO(81, 160, 225, 1),
      backgroundColor: const Color.fromRGBO(95, 99, 109, 1)
    );
  }
}


    
  