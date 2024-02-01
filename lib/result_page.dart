import 'package:bmi_app/bottom_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String interpretation;
  const ResultPage(this.bmi, this.bmiResult, this.interpretation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              kactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.greenAccent[700],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style: const TextStyle(
                        fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            'RECALCULATE',
            () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
