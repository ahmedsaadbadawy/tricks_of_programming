import 'dart:io';

class Agecalculator {
  static var age;
  Agecalculator(int p) {
    print("Enter your birth year");
    int birthYear = p;
    age = DateTime.now().year - birthYear;
    print("your Age is $age Years Old");
  }
}
