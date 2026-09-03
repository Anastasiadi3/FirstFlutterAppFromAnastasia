import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberController = TextEditingController();
  int _counter = 0;

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

 
  void _startCountdown(int startNumber) async {
    for (int i = startNumber; i >= 0; i--) {
     
      if (!mounted) return;

      setState(() {
        _counter = i;
      });

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Countdown'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Γράψε αριθμό για μέτρηση',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int value = int.tryParse(_numberController.text) ?? 0;
                if (value > 0) {
                  _startCountdown(value);
                }
                _numberController.clear();
              },
              child: const Text('Ξεκίνα τη μέτρηση'),
            ),
          ],
        ),
      ),
    );
  }
}