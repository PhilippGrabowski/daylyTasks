import 'package:daily_tasks/hello_world/hello_world.dart';
import 'package:flutter/material.dart';

List<String> texts = ['Test1', 'Text', 'Text3', 'Text4'];

void main() {
  runApp(MaterialApp(home: Aufgabe3()));
}

class Aufgabe1 extends StatelessWidget {
  Aufgabe1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            for (String text in texts)
              Text(text, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class Aufgabe2 extends StatelessWidget {
  Aufgabe2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Text1'), Text('Text2')],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Press Button')),
        ],
      ),
    );
  }
}

class Aufgabe3 extends StatelessWidget {
  Aufgabe3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 2; i++)
              ElevatedButton(
                onPressed: () {},
                child: Text(texts[i], style: TextStyle(color: Colors.green)),
              ),
          ],
        ),
      ),
    );
  }
}
