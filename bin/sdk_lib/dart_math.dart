
import 'dart:math' as math;

void main() {

  /* Trigonometry */
  
  // Cosine
  assert(math.cos(math.PI) == -1.0);
  
  // Sine
  var degrees = 30;
  var radians = degrees * (math.PI / 180);
  // radians is now 0.52359.
  var sinOf30degrees = math.sin(radians);
  
  // Truncate the decimal places to 2.
  assert(double.parse(sinOf30degrees.toStringAsPrecision(2)) == 0.5);
  
  /* Maximum and mininum */
  assert(math.max(1, 1000) == 1000);
  assert(math.min(1, -1000) == -1000);
  
  /* Math constants */
  
  // See the Math library for additional constants.
  print(math.E);
  print(math.PI);
  print(math.SQRT2);
  
  /* Random numbers */
  
  var random = new math.Random();
  print(random.nextDouble()); // Between 0.0 and 1.0: [0, 1)
  print(random.nextInt(10));  // Between 0 and 9.
  
  print(random.nextBool());
  
}
