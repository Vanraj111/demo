import 'package:flutter/material.dart';
///box decoration
 BoxDecoration boxdeco = BoxDecoration(
    //  borderRadius: BorderRadius.circular(15.0),
     shape: BoxShape.circle,
     color: Colors.yellow,
);


///theme

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);


///textstytle
  TextStyle optionStyle =
      TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white);
  

  ///style
   ButtonStyle busty = ElevatedButton.styleFrom(
    elevation: 5,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
    );
///Navigator
///theme button

///decoration
const BoxDecoration boxcnt = BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(10)),
);

TextStyle myTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 25
);
///color

List<Color?> backgroundColors = [
    // const Color(0xFFCCE5FF), // light blue
    // const Color(0xFFD7F9E9), // pale green
    // const Color(0xFFFFF8E1), // pale yellow
    // const Color(0xFFF5E6CC), // beige
    // const Color(0xFFFFD6D6), // light pink
    // const Color(0xFFE5E5E5), // light grey
    // const Color(0xFFFFF0F0), // pale pink
    // const Color(0xFFE6F9FF), // pale blue
    // const Color(0xFFD4EDDA), // mint green
    // const Color(0xFFFFF3CD), // pale orange
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.blue,
     Colors.purple,
      Colors.pink,
       Colors.green,
         Colors.black,
  ];