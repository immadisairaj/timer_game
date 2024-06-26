import 'package:flutter/material.dart';
import 'package:timer_game/time_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mainBarColor = Colors.blue;
  final disabledColor = Colors.blue.shade100;

  bool counterStarted = false;
  bool startStopEnable = true;
  int seconds = 0;

  int counterSpeed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Try to stop the timer at 10:00',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TimeComponent(
                  seconds: seconds,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (startStopEnable) ? _startOrStop : null,
                      child: const Text('Start / Stop'),
                    ),
                    ElevatedButton(
                      onPressed: !counterStarted && seconds > 0
                          ? () {
                              setState(() {
                                seconds = 0;
                                startStopEnable = true;
                              });
                            }
                          : null,
                      child: const Text('Reset'),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                (!counterStarted && seconds == 600) ? 'Congratulations!!' : '',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _startOrStop() {
    setState(() {
      if (seconds >= 3590) {
        seconds = 0;
      }
      counterStarted = !counterStarted;
    });
    if (!counterStarted) {
      _stopCounter();
    } else {
      _startCounter();
    }
  }

  _startCounter() async {
    while (counterStarted) {
      if (seconds >= 3598) _stopCounter();
      setState(() {
        seconds++;
      });
      await Future.delayed(
          Duration(milliseconds: 1000 ~/ (seconds * counterSpeed)));
    }
  }

  _stopCounter() {
    setState(() {
      counterStarted = false;
      startStopEnable = false;
    });
  }
}
