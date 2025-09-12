import 'package:flutter/material.dart';

const Color blue = Color.fromRGBO(33, 150, 243, 1);
const Color red = Color.fromRGBO(244, 67, 54, 1);
const Color green = Color.fromRGBO(76, 175, 80, 1);

class WidgetUebersicht extends StatelessWidget {
  const WidgetUebersicht({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blue,
        title: Text('Aufgabe 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 3; i > 0; i--) Header(index: i),
            for (int i = 0; i < 2; i++) SquareRow(),
            for (int i = 0; i < 2; i++) IconRow(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({super.key, required this.index});

  final int index;
  final List<FontWeight> weights = [FontWeight.w800, FontWeight.w900];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + index * 10),
        if (index > 1)
          Text(
            'Hello App Akademie!',
            style: TextStyle(
              color: blue,
              fontSize: 28,
              fontWeight: weights[index - 2],
            ),
          ),
      ],
    );
  }
}

class SquareRow extends StatelessWidget {
  SquareRow({super.key});

  final Map<String, Color> boxMap = {'A': red, 'B': green, 'C': blue};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10,
          children: [
            for (final box in boxMap.entries)
              Square(label: box.key, color: box.value),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class Square extends StatelessWidget {
  const Square({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 108,
      color: color,
      alignment: Alignment.center,
      child: Container(
        width: 60,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(103, 80, 164, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.face, size: 50), Icon(Icons.face, size: 50)],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
