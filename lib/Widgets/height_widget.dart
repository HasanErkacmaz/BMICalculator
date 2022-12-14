import 'package:flutter/material.dart';


class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key, required this.onChange});
  final Function(int) onChange;
  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
                  elevation: 12,
                  shape: const RoundedRectangleBorder(),
                  child: Column(
                    children: [
                     const Text('Boy' , style: TextStyle(fontSize: 25, color: Colors.grey)
                    ), 
                    const SizedBox(
                      height: 10,
                    ), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _height.toString(), 
                          style: const TextStyle(fontSize: 40),
                        ), 
                        const SizedBox(
                          width: 10,
                        ),
                       const Text('cm', style: TextStyle(fontSize: 20 , color: Colors.grey),)
                      ],
                    ), 
                    sliderWidget()
    
                    ],
                  ),
                ),
    );
  }

  Slider sliderWidget() {
    return Slider(
                    min: 0,
                    max: 240, 
                    thumbColor: Colors.amber,
                  value: _height.toDouble(), 
                  onChanged: (value) {
                    setState(() {
                      _height = value.toInt();
                    });
                    widget.onChange(_height);
                  },);
  }
}