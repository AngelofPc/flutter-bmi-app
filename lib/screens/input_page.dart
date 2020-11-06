import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bmi_calculation.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInActiveCardColor;
  Color femaleCardColor = KInActiveCardColor;

  Gender selectedGender;
  int selectedHeight = 180;
  int selectedWeight = 80;
  int selectedAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : KInActiveCardColor,
                    cardChild: IconContent(
                      contentIcon: FontAwesomeIcons.mars,
                      contentText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : KInActiveCardColor,
                      cardChild: IconContent(
                        contentIcon: FontAwesomeIcons.venus,
                        contentText: 'FEMALE',
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kContentTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        selectedHeight.toString(),
                        style: kBoldText,
                      ),
                      Text(
                        'cm',
                        style: kContentTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGreyColor,
                      thumbColor: kRedColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          selectedHeight = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kContentTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    selectedWeight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kContentTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  selectedAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  selectedAge++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            buttonTap: () {
              BMICalculation calculate = BMICalculation(height: selectedHeight, weight: selectedWeight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calculate.calculateBMI(),
                    resultText: calculate.getResult(),
                    interpretation: calculate.getInterpretation(),
                  )));
            },
          ),
        ],
      ),
    );
  }
}



