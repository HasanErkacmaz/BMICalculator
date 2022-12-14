import 'package:flutter/material.dart';

class AgeAndWeightWidget extends StatefulWidget {
  const AgeAndWeightWidget({
    super.key,
    required this.title,
    required this.initValue,
    required this.onChange,
  });

  final String title;
  final String initValue;
  final Function(String) onChange;

  @override
  State<AgeAndWeightWidget> createState() => _AgeAndWeightWidgetState();
}

class _AgeAndWeightWidgetState extends State<AgeAndWeightWidget> {
  final myAgeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myAgeController.text = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(children: [
              Text(widget.title, style: const TextStyle(fontSize: 20, color: Colors.grey)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 50,
                      child: TextField(keyboardType: TextInputType.number,
                        controller: myAgeController,
                        onChanged: (value) {
                          widget.onChange(myAgeController.text);
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              )
            ])));
  }
}
