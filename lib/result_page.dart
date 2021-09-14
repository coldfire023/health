import 'package:flutter/material.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretationText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: kAllColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      resultText,
                      style: kResultText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretationText,
                      textAlign: TextAlign.center,
                      style: kBodyText,
                    ),
                  ],
                ),
                onPress: () {}),
          ),
          Expanded(
              child: BottomButton(
            buttonTitle: 'CALCULATE AGAIN',
            onTap: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
