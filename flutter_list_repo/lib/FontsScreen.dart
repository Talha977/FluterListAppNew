import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class FontsScreen extends StatefulWidget {
  const FontsScreen({Key key}) : super(key: key);

  @override
  _FontsScreenState createState() => _FontsScreenState();
}

class _FontsScreenState extends State<FontsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fonts Screen')),
      body: ListView(
        children: [
          Text(
            'Font 1 Sample',
            style: GoogleFonts.lato(height: 10),
          ),
          Text('Font 2 Sample', style: GoogleFonts.aBeeZee(fontSize: 50)),
          Text('Font 3 Sample', style: GoogleFonts.oswald(fontSize: 30)),
          Text('Font 4 Sample', style: GoogleFonts.bahiana(fontSize: 20)),
          Text('Font 5 Sample', style: GoogleFonts.cabin(fontSize: 24))
        ],
      ),
    );
  }
}
