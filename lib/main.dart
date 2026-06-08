import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMIstate(),
    );
  }
}

class BMIstate extends StatefulWidget {
  @override
  _BMIstate createState() => _BMIstate();
}

class _BMIstate extends State<BMIstate> {
  String bmiResult = ' ';
  int colorNumber = 0;

  final _formkey = GlobalKey<FormState>();

  final heightCont = TextEditingController();
  final weightCont = TextEditingController();

  List<Color> colors = [Colors.greenAccent, Colors.black12,
  Colors.white70, Colors.pink, Colors.tealAccent];

  void changeColor() {
    setState(() {
      colorNumber++;
      colorNumber = colorNumber % colors.length;
    });

  }

  Color textColor(Color currColor) {
    if (currColor.computeLuminance() < .5) {
      return Colors.white;
    }
    else {
      return Colors.black;
    }
  }

  void bmiCalculate(){
    if(_formkey.currentState!.validate()) {
      double height = double.parse(heightCont.text);
      double weight = double.parse(weightCont.text);

      double bmi = (weight / (height * height)) * 703;

      String result;

      if (bmi < 18.5) {
        result = 'Underweight';
      }
      else if (bmi < 25) {
        result = 'Normal';
      }
      else if (bmi < 30) {
        result = 'Overweight';
      }
      else {
        result = 'Obese';
      }


      setState(() {
        bmiResult = 'Your BMI is ${bmi.toStringAsFixed(1)} and your result is $result';
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    Color currColor = colors[colorNumber];

    Color currTextColor = textColor(currColor);

    return Scaffold(
      backgroundColor: currColor,

      appBar: AppBar(
        title:
        Text(
            "Kathleen's BMI Calculator"
        ),
          centerTitle: true,
          backgroundColor: currColor,
        foregroundColor: currTextColor,

      ),

      body: GestureDetector(
        onTap: changeColor,
        child: Container(
          padding: EdgeInsets.all(40),
          color: currColor,
          child: Form(

            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: heightCont,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: currTextColor),
                  decoration: InputDecoration(
                    labelText: "Height in inches",
                    labelStyle: TextStyle(color: currTextColor),
                    hintText: 'Ex: 60',
                    hintStyle: TextStyle(color: currTextColor),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'You must enter a height';
                    }

                    double? height = double.tryParse(value);

                    if (height == null) {
                      return 'Height must be a number';
                    }
                    if (height <= 0) {
                      return 'Height must be a positive nonzero number';
                    }
                    return null;

                  }
                ),
                SizedBox(height:20),
                TextFormField(
                    controller: weightCont,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: currTextColor),
                    decoration: InputDecoration(
                      labelText: "Weight in pounds",
                      labelStyle: TextStyle(color: currTextColor),
                      hintText: 'Ex: 140',
                      hintStyle: TextStyle(color: currTextColor),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter a weight';
                      }

                      double? weight = double.tryParse(value);

                      if (weight == null) {
                        return 'Weight must be a number';
                      }
                      if (weight <= 0) {
                        return 'Weight must be a positive nonzero number';
                      }
                      return null;

                    }
                ),
                SizedBox(height:20),

                ElevatedButton(
                    onPressed: bmiCalculate,
                    child: Text('Calculate BMI')
                ),
                SizedBox(height:20),
                Text(
                  bmiResult,
                  style: TextStyle(
                    color: currTextColor,
                    fontSize: 20
                  ),
                )

              ],
            ),
          ),
        ),

      ),
    );
  }
}

