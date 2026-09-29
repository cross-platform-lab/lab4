import 'dart:math';

import 'package:flutter/material.dart';

// Lab 4: Magic 8 Ball
// Nhấn vào quả cầu hoặc nút "Hỏi" để nhận một câu trả lời ngẫu nhiên.
void main() {
  runApp(const MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Ask Me Anything', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: const BallPage(),
      ),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  static const List<String> answers = [
    'Yes',
    'No',
    'Ask again later',
    'The answer is yes',
    'I have no idea',
  ];

  final Random _random = Random();
  int ballNumber = 1;

  void askBall() {
    setState(() {
      ballNumber = _random.nextInt(answers.length) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hãy nghĩ về một câu hỏi...',
            style: TextStyle(fontSize: 20, color: Colors.white70, fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: GestureDetector(
              onTap: askBall,
              child: Image.asset('assets/images/ball$ballNumber.png'),
            ),
          ),
          Text(
            answers[ballNumber - 1],
            style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: askBall,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Hỏi quả cầu', style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue[900],
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
