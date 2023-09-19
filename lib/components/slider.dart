import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';

class MySlider extends StatefulWidget {
  final ValueChanged<double>? onSliderValueChanged;

  const MySlider({Key? key, this.onSliderValueChanged}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentSliderValue = 2;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 225,
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
          min: 2,
          max: 6,
          divisions: 4,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
              Globals.numberOfPlayers = value.toInt();
            });

          },
        ),
      ),
    );
  }
}

