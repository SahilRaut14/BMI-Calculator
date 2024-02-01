import 'dart:math';

class BmiLogic {
  final int height;
  final int weight;

  BmiLogic(this.height, this.weight);
  late double bmi;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi < 18.4) {
      return "Underweight";
    } else if (bmi < 24.9) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  String interpretation() {
    if (bmi < 18.4) {
      return 'You have lower BMI.Please eat more.';
    } else if (bmi < 24.9) {
      return 'You have Normal BMI. Good JOB!';
    } else {
      return 'You have higher than normal BMI. Please work more!';
    }
  }
}
