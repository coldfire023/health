import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/result_page.dart';
import 'icon_context.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_button.dart';
import 'calculator_brain.dart';

enum GenderType {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? gender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = GenderType.Male;
                      });
                    },
                    colour:
                        gender == GenderType.Male ? kAllColor : inactiveColor,
                    cardChild: IconText(
                      myIcons: FontAwesomeIcons.mars,
                      myGender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = GenderType.Female;
                      });
                    },
                    colour:
                        gender == GenderType.Female ? kAllColor : inactiveColor,
                    cardChild: IconText(
                      myIcons: FontAwesomeIcons.venus,
                      myGender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kAllColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kAllColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kAllColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretationText: calc.getInterpretation());
                }));
              },
              buttonTitle: 'CALCULATE'),
        ],
      ),
    );
  }
}
