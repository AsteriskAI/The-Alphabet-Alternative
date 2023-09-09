import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';


class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 5,
          inactiveTickMarkColor: Colors.transparent,
          activeTickMarkColor: Colors.transparent,
          activeTrackColor: Globals.globalColorScheme.tertiary,
          thumbColor: Globals.globalColorScheme.outline, 
          overlayColor: Globals.globalColorScheme.errorContainer.withOpacity(0.1), 
          inactiveTrackColor: Globals.globalColorScheme.tertiary.withOpacity(0.3), 
          valueIndicatorColor: Globals.globalColorScheme.errorContainer, 
          valueIndicatorTextStyle: TextStyle(
            color: Globals.globalColorScheme.onPrimary, 
          ),
        ),
        child: Slider(
          value: _currentSliderValue,
          min: 0,
          max: 6,
          divisions: 3,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ),
    );
  }
}
