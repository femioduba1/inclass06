import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IgnitionSystem(),
    );
  }
}

// Screen 1: Ignition System
class IgnitionSystem extends StatefulWidget {
  const IgnitionSystem({super.key});

  @override
  State<IgnitionSystem> createState() => _IgnitionSystemState();
}

class _IgnitionSystemState extends State<IgnitionSystem> {
  bool ignitionOn = false;

  void toggleIgnition() {
    setState(() {
      ignitionOn = !ignitionOn;
    });
  }

  void goToController() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CounterWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ignitionOn ? Colors.black : Colors.grey[300],
      appBar: AppBar(
        title: const Text("Rocket Ignition System"),
        backgroundColor: ignitionOn ? Colors.red : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ignitionOn ? "IGNITION ACTIVE 🔥" : "Ignition OFF",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ignitionOn ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: toggleIgnition,
              style: ElevatedButton.styleFrom(
                backgroundColor: ignitionOn ? Colors.red : Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                ignitionOn ? "Shut Down Ignition" : "Start Ignition",
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),

            // Only allow moving forward if ignition is ON
            ElevatedButton(
              onPressed: ignitionOn ? goToController : null,
              child: const Text("Go to Launch Controller"),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2: Launch Controller (Visual Countdown + LIFTOFF)
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  Color _getCounterColor() {
    if (_counter == 0) return Colors.red;
    if (_counter <= 50) return Colors.orange;
    return Colors.green; // 51-100
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                _counter == 100 ? '🚀 LIFTOFF!' : '$_counter',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: _getCounterColor(),
                ),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
