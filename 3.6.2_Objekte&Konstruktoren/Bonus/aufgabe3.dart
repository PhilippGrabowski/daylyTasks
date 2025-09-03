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
}