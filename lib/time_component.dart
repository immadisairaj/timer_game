import 'package:digital_lcd_number/digital_lcd_number.dart';
import 'package:flutter/material.dart';

class TimeComponent extends StatelessWidget {
  TimeComponent({
    super.key,
    required this.seconds,
  }) : assert(seconds >= 0 && seconds < 3600);

  final int seconds;

  final color = Colors.blue;
  final disabledColor = Colors.blue.shade100;

  Widget _bar(
      {double height = 10, double width = 10, Color barColor = Colors.grey}) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
        BoxShadow(
          color: barColor.withAlpha(220),
          blurRadius: 10.0,
          spreadRadius: 10.0,
          offset: const Offset(
            0.0,
            0.0,
          ),
        ),
      ]),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: barColor,
        ),
      ),
    );
  }

  Widget _hyphen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bar(
              height: 5,
              width: 5,
              barColor: color,
            ),
            _bar(
              height: 5,
              width: 5,
              barColor: color,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Center(
      child: Padding(
        padding: isLandscape
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6)
            : const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: DigitalLcdNumber(
                number: ((seconds ~/ 60) ~/ 10) % 10,
                color: color,
                disabledColor: disabledColor,
              ),
            ),
            Flexible(
              flex: 1,
              child: DigitalLcdNumber(
                number: (seconds ~/ 60) % 10,
                color: color,
                disabledColor: disabledColor,
              ),
            ),
            _hyphen(),
            Flexible(
              flex: 1,
              child: DigitalLcdNumber(
                number: ((seconds % 60) ~/ 10) % 10,
                color: color,
                disabledColor: disabledColor,
              ),
            ),
            Flexible(
              flex: 1,
              child: DigitalLcdNumber(
                number: (seconds % 60) % 10,
                color: color,
                disabledColor: disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
