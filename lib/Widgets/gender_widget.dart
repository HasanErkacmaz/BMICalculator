import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';


class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.onChange});

 final Function(int) onChange;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
   int _gender = 0;
final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
              topColor: Colors.grey, 
              backColor: Colors.grey, 
              borderRadius: BorderRadius.circular(20)
            );

   final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
              topColor: Colors.white, 
              backColor: Colors.grey[300]!, 
              borderRadius: BorderRadius.circular(20)
            );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          choiceChipMan(),
          const SizedBox(
              width: 20,
          ),
           choiceChipWoman()
        ],
      ),
    );
  }

  ChoiceChip3D choiceChipWoman() {
    return ChoiceChip3D(
          border: Border.all(color: Colors.grey),
          style: _gender == 2 ? selectedStyle : unselectedStyle,
        onSelected: () {
          setState(() {
            _gender = 2;
          });
           widget.onChange(_gender);
        }, 
        onUnSelected: () {}, 
        selected: _gender == 2,
        child: Column(
          children: [
            Image.asset('Assets/image/Woman.jpg' , height: 50), 
            const SizedBox(
              height: 3,
            ), 
            const Text('Kadın')
          ],
        ),
        );
  }

  ChoiceChip3D choiceChipMan() {
    return ChoiceChip3D(
          border: Border.all(color: Colors.grey),
          style: _gender == 1 ? selectedStyle : unselectedStyle,
        onSelected: () {
          setState(() {
            _gender = 1;
          });
          widget.onChange(_gender);
        }, 
        onUnSelected: () {}, 
        selected: _gender == 1,
        child: Column(
          children: [
            Image.asset('Assets/image/Man.jpg' ,  height: 50,), 
            const SizedBox(
              height: 3,
            ), 
            const Text('Erkek')
          ],
        ),
        );
  }
}