import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels {

  static TextStyle hintFormStyle= GoogleFonts.ubuntu(
    color: Colors.white, 
    fontSize: 16,
    fontWeight: FontWeight.w300
  );
  static TextStyle labelFormStyle= GoogleFonts.ubuntu(
        color:const Color.fromRGBO(173, 176, 184, 1),
        fontSize: 12,
        fontWeight: FontWeight.w400
  );
  static TextStyle whiteW300Size16= GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.white
  );

  static TextStyle title32W400White= GoogleFonts.ubuntu(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );

  static TextStyle enterpriseTitle= GoogleFonts.ubuntu(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle noPageFound= GoogleFonts.montserratAlternates(
    fontSize: 50,
    fontWeight: FontWeight.bold
  ); 

  static TextStyle subtitle20W200White= GoogleFonts.ubuntu(
    fontSize: 20,
    fontWeight: FontWeight.w200,
    color: Colors.white
  );

  static TextStyle textSpanLink= GoogleFonts.ubuntu(
    fontSize: 14,
    color: const Color.fromRGBO(81, 160, 225, 1),
    fontWeight: FontWeight.w400
  );

  static TextStyle textSpanBasic= GoogleFonts.ubuntu(
    fontSize: 14,
    color: const Color.fromRGBO(173, 176, 184, 1),
    fontWeight: FontWeight.w400
  );

  
}