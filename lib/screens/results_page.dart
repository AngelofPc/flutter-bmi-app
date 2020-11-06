import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(185.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kLargeText,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kColoredResult,
                    ),
                    Text(
                      bmiResult,
                      style: kBMIResult,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kWhiteResult,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            buttonTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
