import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color? fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    Key? key,
    required this.text,
    this.fillColor,
    this.textColor = 0xFF050000,
    this.textSize = 21,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          color: fillColor ?? const Color(0xFF6C807F),
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
