import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({required this.buttonText, required this.color, required this.textColor, this.buttontapped});
  final String buttonText;
  final  Color color;
  final Color textColor;
  final  buttontapped;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: EdgeInsets.all(0.2),
      ),
    );
  }
}
