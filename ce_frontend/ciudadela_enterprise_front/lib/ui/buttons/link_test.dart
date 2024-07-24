import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LinksText extends StatefulWidget {

  final String text;
  final Function? onPressed;
  const LinksText({super.key, required this.text, this.onPressed});

  @override
  State<LinksText> createState() => _LinksTextState();
}

class _LinksTextState extends State<LinksText> {

  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: 
            Text(
                  widget.text,
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(81, 160, 225, 1),
                    decoration: isHover ? TextDecoration.underline : TextDecoration.none
                  ),
            )
        ),
      ),
    );
  }
}