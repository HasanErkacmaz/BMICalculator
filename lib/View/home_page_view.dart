import 'dart:math';

import 'package:bmi_calculator/View/score_screen.dart';

import 'package:bmi_calculator/Widgets/gender_widget.dart';
import 'package:bmi_calculator/Widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Widgets/new_age_and_weight_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _gender = 0;
  int _height = 150;
  String _age = '30';
  String _weight = '50';
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('BMi Hesaplayıcı')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                genderWidget(),
                heightWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ageWidget(), weightWidget()],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SizedBox(
                    width: 200,
                    child: calculateButton(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton calculateButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        debugPrint(_weight);
        calculateBmi();
        Navigator.push(
            context,
            PageTransition(
                child: ScoreScreen(bmiScore: _bmiScore, age: int.parse(_age)), type: PageTransitionType.fade));
      },
      label: const Text('Hesapla'),
    );
  }

  HeightWidget heightWidget() {
    return HeightWidget(onChange: (heightVal) {
      _height = heightVal;
    });
  }

  GenderWidget genderWidget() {
    return GenderWidget(
      onChange: (genderVal) {
        _gender = genderVal;
      },
    );
  }

  AgeAndWeightWidget weightWidget() {
    return AgeAndWeightWidget(
      onChange: (newControllerText) {
        _weight = newControllerText;
      },
      title: 'Kilo (KG)',
      initValue: '30',
    );
  }

  AgeAndWeightWidget ageWidget() {
    return AgeAndWeightWidget(
      title: 'Yaş',
      initValue: '30',
      onChange: (newControllerText) {
        _age = newControllerText;
      },
    );
  }


  void calculateBmi() {
    _bmiScore = (int.parse(_weight)) / (pow(_height / 100, 2));
   
  }
}
