import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({super.key});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromRGBO(55, 57, 63, 1),
      height: (size.width>1000)?size.height * 0.08:null,
      child: Center(
        child: Text(
          'Powered by MirusSmart',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w200
          ),
        ),
      )
    );
  }
}