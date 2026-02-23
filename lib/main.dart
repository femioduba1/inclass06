import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IgnitionSystem(),
    );
  }
}

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
          ],
        ),
      ),
    );
  }
}