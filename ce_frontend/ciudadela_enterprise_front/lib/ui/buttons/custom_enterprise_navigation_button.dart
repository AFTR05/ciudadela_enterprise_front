import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomEnterpriseNavigationButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isSelected;

  const CustomEnterpriseNavigationButton(
    {super.key, 
    required this.onPressed, 
    required this.text, this.isSelected=false}
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
        side: const MaterialStatePropertyAll(
          BorderSide(color: Colors.transparent)
        ),
        mouseCursor: const MaterialStatePropertyAll(
          SystemMouseCursors.click
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(0, 248, 218, 218)
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.transparent, // Sin cambio de color al pasar el cursor
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        child: Text(
          text,
          style: GoogleFonts.ubuntu(fontSize: 16,color: Colors.white.withOpacity(isSelected?1:0.7),fontWeight: FontWeight.w400)
        ),
      ),
    );
  }
}