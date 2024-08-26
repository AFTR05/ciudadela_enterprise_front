import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class ActionCardButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color colorFilled;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isFilled;

  const ActionCardButton(
    {super.key, 
    required this.onPressed, 
    required this.text, 
    this.colorFilled=const Color.fromRGBO(95, 99, 109, 1), 
    this.textColor=Colors.white, 
    this.horizontalPadding=0, 
    this.verticalPadding=0, 
    this.isFilled=true}
  );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          )
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: colorFilled)
        ),
        mouseCursor: const MaterialStatePropertyAll(
          SystemMouseCursors.click
        ),
        backgroundColor: MaterialStateProperty.all(
          isFilled
            ?colorFilled.withOpacity(1)
            :Colors.transparent
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
        child: Text(
          text,
          style: CustomLabels.white14W400Inter
        ),
      ),
    );
  }
}