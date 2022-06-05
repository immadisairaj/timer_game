import 'package:flutter/material.dart';

class LcdNumber extends StatelessWidget {
  const LcdNumber({
    super.key,
    required this.number,
    this.mainBarColor = Colors.blue,
    this.disabledColor = Colors.black,
  }) : assert(number >= 0 && number <= 9);

  final int number;

  final Color mainBarColor;
  final Color disabledColor;

  final double barLength = 50;
  final double barWidth = 5;

  static Widget bar(
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: (barLength * 2) + (barWidth * 3),
        width: (barLength) + (barWidth * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bar(
              height: barWidth,
              width: barLength,
              barColor: (number == 2 ||
                      number == 3 ||
                      number == 5 ||
                      number == 6 ||
                      number == 7 ||
                      number == 8 ||
                      number == 9 ||
                      number == 0)
                  ? mainBarColor
                  : disabledColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bar(
                  height: barLength,
                  width: barWidth,
                  barColor: (number == 4 ||
                          number == 5 ||
                          number == 6 ||
                          number == 8 ||
                          number == 9 ||
                          number == 0)
                      ? mainBarColor
                      : disabledColor,
                ),
                bar(
                  height: barLength,
                  width: barWidth,
                  barColor: (number == 1 ||
                          number == 2 ||
                          number == 3 ||
                          number == 4 ||
                          number == 7 ||
                          number == 8 ||
                          number == 9 ||
                          number == 0)
                      ? mainBarColor
                      : disabledColor,
                ),
              ],
            ),
            bar(
              height: barWidth,
              width: barLength,
              barColor: (number == 2 ||
                      number == 3 ||
                      number == 4 ||
                      number == 5 ||
                      number == 6 ||
                      number == 8 ||
                      number == 9)
                  ? mainBarColor
                  : disabledColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bar(
                  height: barLength,
                  width: barWidth,
                  barColor:
                      (number == 2 || number == 6 || number == 8 || number == 0)
                          ? mainBarColor
                          : disabledColor,
                ),
                bar(
                  height: barLength,
                  width: barWidth,
                  barColor: (number == 1 ||
                          number == 3 ||
                          number == 4 ||
                          number == 5 ||
                          number == 6 ||
                          number == 7 ||
                          number == 8 ||
                          number == 9 ||
                          number == 0)
                      ? mainBarColor
                      : disabledColor,
                ),
              ],
            ),
            bar(
              height: barWidth,
              width: barLength,
              barColor: (number == 2 ||
                      number == 3 ||
                      number == 5 ||
                      number == 6 ||
                      number == 8 ||
                      number == 9 ||
                      number == 0)
                  ? mainBarColor
                  : disabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
