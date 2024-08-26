
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double rightMargin;
  final double leftMargin;
  final double topMargin;
  final double bottomMargin;

  const DetailCard({super.key, this.width, this.height, required this.child, this.rightMargin=30, this.leftMargin=0, this.topMargin=15, this.bottomMargin=15,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width!=null) ? width : null,
      height: (height!=null) ? height : null,
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin, top: topMargin, bottom: bottomMargin),
      padding: const EdgeInsets.all(20),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          child
        ],
      ),
    );
  }

  
}

BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: const Color.fromRGBO(55, 57, 63,1),
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );