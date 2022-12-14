import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
  ScoreScreen({super.key, required this.bmiScore, required this.age});

  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;
  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMİ Puanı'),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Puanın', style: TextStyle(fontSize: 30, color: Colors.blue)),
                    prettyGaugeWidget(),
                    const SizedBox(height: 10),
                    Text(bmiStatus ?? '', style: TextStyle(fontSize: 20, color: bmiStatusColor ?? Colors.black)),
                    const SizedBox(height: 10),
                    Text(bmiInterpretation ?? '', style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [tekrarHesapButton(context), const SizedBox(width: 10), paylasButton()],
                    )
                  ],
                ))));
  }

  ElevatedButton paylasButton() {
    return ElevatedButton(
        onPressed: () {
          Share.share("BMİ puanın ${bmiScore.toStringAsFixed(1)} , yaşın $age  ve vücut durumun $bmiStatus ");
        },
        child: const Text('Paylaş'));
  }

  ElevatedButton tekrarHesapButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Tekrar Hesapla'));
  }

  PrettyGauge prettyGaugeWidget() {
    return PrettyGauge(
      gaugeSize: 300,
      minValue: 0,
      maxValue: 40,
      segments: [
        GaugeSegment('Zayıf', 18.5, Colors.red),
        GaugeSegment('Normal', 6.4, Colors.green),
        GaugeSegment('Kilolu', 5, Colors.orange),
        GaugeSegment('Obez', 10.1, Colors.pink)
      ],
      valueWidget: Text(
        bmiScore.toStringAsFixed(1),
        style: const TextStyle(fontSize: 40),
      ),
      currentValue: bmiScore.toDouble(),
      needleColor: Colors.blue,
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = 'Obez';
      bmiInterpretation = 'Lütfen obeziteyi yenmek için tüm iradenle savaş!';
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = 'Kilolu';
      bmiInterpretation = 'Düzenli egzersiz yap ve biraz kilo ver';
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = 'Normal';
      bmiInterpretation = 'Keyfine bak sen fitsin';
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = 'Zayıf';
      bmiInterpretation = 'Sağlıklı şekilde kilo almaya çalış';
      bmiStatusColor = Colors.red;
    }
  }
}
