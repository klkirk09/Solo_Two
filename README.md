# READ ME FOR SOLO TWO

This is a simple BMI calculator for the Solo Two assignment.

# Functionalality

This Flutter app calculates a user's BMI by taking height and weight as input and outputting their BMI in numerical format and what BMI category they fit into. The app takes height in inches and weight in pounds and validates both inputs to ensure that they are the right data type. The BMI calculation uses the standard formula to calculate BMI.

The app also cycles through 5 background colors when the user taps anywhere on the background of the app. The text color dynamically changes based on the brightness of the background color being displayed using the luminance functionality in flutter. 

# How to use

1) Open the project in Android Studio
2) Start an android emulator
3) Run 'flutter run'

# Sample Tests:

Height: 65
Weight: 140
Result: Your BMI is 23.3 and your result is Normal

Height: 55
Weight: 190
Result: Your BMI is 44.2 and your result is Obese 

Height: abc
Weight: -5
Result: Height must be a number, Weight must be a positive nonzero number

Height: 0
Weight: 100
Result: Height must be a positive nonzero number

