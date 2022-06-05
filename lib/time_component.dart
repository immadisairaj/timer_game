import 'package:flutter/material.dart';
import 'package:timer_game/lcd_number.dart';

class TimeComponent extends StatelessWidget {
  TimeComponent({
    super.key,
    required this.seconds,
  }) : assert(seconds >= 0 && seconds < 3600);

  final int seconds;

  final mainBarColor = Colors.blue;
  final disabledColor = Colors.blue.shade100;

  Widget _hyphen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LcdNumber.bar(
              height: 5,
              width: 5,
              barColor: mainBarColor,
            ),
            LcdNumber.bar(
              height: 5,
              width: 5,
              barColor: mainBarColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LcdNumber(
            number: ((seconds ~/ 60) ~/ 10) % 10,
            mainBarColor: mainBarColor,
            disabledColor: disabledColor,
          ),
          LcdNumber(
            number: (seconds ~/ 60) % 10,
            mainBarColor: mainBarColor,
            disabledColor: disabledColor,
          ),
          _hyphen(),
          LcdNumber(
            number: ((seconds % 60) ~/ 10) % 10,
            mainBarColor: mainBarColor,
            disabledColor: disabledColor,
          ),
          LcdNumber(
            number: (seconds % 60) % 10,
            mainBarColor: mainBarColor,
            disabledColor: disabledColor,
          ),
        ],
      ),
    );
  }
}
