class Widget {}

class MaterialApp extends Widget {
  Widget? home;

  MaterialApp({this.home});
}

class Scaffold extends Widget {
  Widget? body;

  Scaffold({this.body});
}

class Center extends Widget {
  Widget? child;

  Center({this.child});
}

class Column extends Widget {
  List<Widget>? children;

  Column({this.children});
}

class Text extends Widget {
  String data;

  Text(this.data);
}

void main(List<String> args) {
  Widget myApp = MaterialApp(
    home: Scaffold(
      body: Center(child: Column(children: [Text('Hallo'), Text('Welt')])),
    ),
  );

  print(myApp);
}
