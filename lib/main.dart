import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text('Is It The Same'),
          backgroundColor: Colors.indigo,
        ),
        body: const ImagePage(),
      ),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'Congratulation' : 'Try Again',
          style: TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple[50],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      leftImageNumber = Random().nextInt(8) + 1;
                      rightImageNumber = Random().nextInt(8) + 1;
                    });
                  },
                  child: Image.asset('images/image-$leftImageNumber.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      rightImageNumber = Random().nextInt(8) + 1;
                      leftImageNumber = Random().nextInt(8) + 1;
                    });
                  },
                  child: Image.asset('images/image-$rightImageNumber.png'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
