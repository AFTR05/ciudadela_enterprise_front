import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomNavigationButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color colorFilled;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isFilled;

  const CustomNavigationButton(
    {super.key, 
    required this.onPressed, 
    required this.text, 
    this.colorFilled=const Color.fromRGBO(55, 57, 63, 1), 
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
            borderRadius: BorderRadius.circular(8)
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
          style: GoogleFonts.ubuntu(fontSize: 16,color: textColor,fontWeight: FontWeight.w400)
        ),
      ),
    );
  }
}