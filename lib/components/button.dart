import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
   myButton({required this.Buttontext, required this.color, required this.textColor, this.buttonTapped});
  final String Buttontext;
  final Color color;
  final Color textColor;
  final  buttonTapped;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.all(0.2),
      ),
    );
  }
}
