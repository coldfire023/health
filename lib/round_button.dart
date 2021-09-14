import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.press});
  final IconData icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: press,
      shape: CircleBorder(),
      fillColor: Color(0xFF8D8E98),
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
    );
  }
}
