
void main() {
  throw new BarException();
//  throw new FooException("SSS");
}

class FooException implements Exception {
  final String msg;
  const FooException(this.msg);
  String toString() => msg == null ? "FooException" : msg;  
}

class BarException implements Exception {
}