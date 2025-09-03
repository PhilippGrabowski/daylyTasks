class Rectangle {
  double width; // x
  double height; // y

  Rectangle({required this.width, required this.height});

  double get scope {
    return 2 * this.width + 2 * this.height;
  }

  double get area {
    return this.width * this.height;
  }

  void scale(double factor) {
    this.width *= factor;
    this.height *= factor;
  }
}

void main(List<String> args) {
  Rectangle rec = Rectangle(width: 5.0, height: 2.5);
  print(rec.area); // 12.5
  print(rec.scope); // 15.0

  rec.scale(2);
  print(rec.area); // 50.0
  print(rec.scope); // 30.0

  rec.scale(0.5);
  print(rec.area); // 12.5
  print(rec.scope); // 15.0
}