import 'package:flutter/material.dart';

class AgeAndWeightWidgetOld extends StatefulWidget {
  const AgeAndWeightWidgetOld(
      {super.key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max});
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;
  @override
  State<AgeAndWeightWidgetOld> createState() => _AgeAndWeightWidget();
}

class _AgeAndWeightWidget extends State<AgeAndWeightWidgetOld> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
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
                    InkWell(
                      child: const RemoveAvatar(),
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                    const SizedBox(width: 15),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      child: const AddAvatar(),
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange(counter);
                      },
                    )
                  ],
                ),
              )
            ])));
  }
}

class AddAvatar extends StatelessWidget {
  const AddAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 12,
      backgroundColor: Colors.amber,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class RemoveAvatar extends StatelessWidget {
  const RemoveAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 12,
      backgroundColor: Colors.amber,
      child: Icon(
        Icons.remove,
        color: Colors.white,
      ),
    );
  }
}
