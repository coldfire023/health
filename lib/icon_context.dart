import 'package:flutter/material.dart';
import 'constants.dart';

class IconText extends StatelessWidget {
  IconText({required this.myIcons, required this.myGender});

  final IconData myIcons;
  final String myGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcons,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          myGender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
