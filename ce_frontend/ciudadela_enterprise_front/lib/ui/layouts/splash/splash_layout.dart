import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.grey, 
            ),
          ],
        ),
      ),
    );
  }
}