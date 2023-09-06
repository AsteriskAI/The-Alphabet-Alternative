import 'package:alphabetalternative/main.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textcolor;

  CustomButton({required this.text, required this.onPressed, required this.color, required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    boxShadow: [
      BoxShadow(
        color: globalColorScheme.primary.withOpacity(.55),
        blurRadius: 15,
      ),
    ],
        ),
        width: 150,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 22,color: textcolor),
          ),
          style: ButtonStyle(
              
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.all<Color>(
            color, ),
                  ),
        ),
      ),
    );
  }
}
