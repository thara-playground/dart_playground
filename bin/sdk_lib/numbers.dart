
void main() {
  assert(int.parse("32") == 32);
  assert(double.parse("0.50") == 0.5);
  
  // Convert an int to a string.
  assert(43.toString() == '43');
  
  // Convert a double to a string.
  assert(123.456.toString() == '123.456');
  
  // Specify the number of digits after the devimal.
  assert(123.456.toStringAsFixed(2) == "123.46");
  
  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse("1.2e+2") == 120.0);
}