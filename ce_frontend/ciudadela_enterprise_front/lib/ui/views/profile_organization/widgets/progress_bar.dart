

import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {

  final double progress;

  const ProgressBar({super.key, required this.progress});

  

  

  @override
  Widget build(BuildContext context) {

    return LinearProgressIndicator(
      value: progress,
      color: const Color.fromRGBO(81, 160, 225, 1),
      backgroundColor: const Color.fromRGBO(95, 99, 109, 1)
    );
  }
}


    
  