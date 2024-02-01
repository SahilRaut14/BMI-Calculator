import 'package:bmi_app/bmi_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'reusable_card.dart';
import 'icon_button.dart' as iconButton;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = const Color(0xff111328);
  Color femaleCardColor = const Color(0xff111328);

  int height = 120;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = kactiveCardColor;
                        femaleCardColor = kinactiveCardColor;
                      });
                    },
                    child: ReuseableCard(
                      maleCardColor,
                      const IconContent(FontAwesomeIcons.mars, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          femaleCardColor = kactiveCardColor;
                          maleCardColor = femaleCardColor;
                        },
                      );
                    },
                    child: ReuseableCard(
                      femaleCardColor,
                      const IconContent(FontAwesomeIcons.venus, 'Female'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              kactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kbuttonStyle,
                      ),
                      const Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderOverlayShape(overlayRadius: 5.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: kinactiveCardColor,
                      activeColor: kbottomCardColor,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(
                          () {
                            height = value.round();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReuseableCard(
                    kactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: klabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kbuttonStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconButton.IconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            iconButton.IconButton(
                              FontAwesomeIcons.plus,
                              () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    kactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Age', style: klabelTextStyle),
                        Text(
                          age.toString(),
                          style: kbuttonStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconButton.IconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            iconButton.IconButton(
                              FontAwesomeIcons.plus,
                              () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            'CALCULATE',
            () {
              BmiLogic bmiLogic = BmiLogic(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiLogic.calculateBMI(),
                          bmiLogic.getResult(),
                          bmiLogic.interpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
