
printNumber(num aNumber) {
  print('The number is $aNumber.');
}

void main() {
  sampleVariables();
  
  // Numbers
  sampleNumbers();
  
  // Strings
  sampleStrings();
  
  // Booleans
  sampleBooleans();
  
  // Collections
  sampleCollections();
  
  // Functions
  sampleFunctions();
  
  // Operators
  sampleOperators();
  
  // Control flow statements
  sampleControlFlowStatements();
  
  // Exceptions
  sampleException();
}

void sampleControlFlowStatements() {
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());
  
  var collection = [0,1,2];
  for (var x in collection) {
    print(x);
  }
}

void sampleException() {
  breedMoreLlamas(num) {
    if (num == 0) throw new Exception("num is 0.");
    if (num % 2 != 0) throw new OddException();
    throw "No specified Exception";
  }
  
  
  try {
    breedMoreLlamas(4);
  } on OddException catch(e) {
    print("catch OddException");
  } on Exception catch(e) {
    print("Unknows exception : $e");
  } catch (e) {
    print("Somthing really unknown : $e");
  } finally {
    print("finally!");
  }
}

class OddException implements Exception {
  
}

void sampleOperators() {
   var a = 2;
  var b = 3;
  
  assert(a + b == 5);
  assert(a - b == -1);
  assert(a * b == 6);
  assert(a / b > 0.6 && a / b < 0.7);
  assert(a ~/ b == 0);
  assert(a % b == 2);
  
  var person = new Person();
  if (person is Person) {
    person.firstName = "Bob";
  }
  
  (person as Person).firstName = "Bob";
  
  a = 2;
  a *= 3;
  assert(a == 6);
  
  final value = 0x22;
  final bitmask = 0x0f;
  
  assert((value & bitmask) == 0x02);    // AND
  assert((value & ~bitmask) == 0x20);   // AND NOT
  assert((value | bitmask) == 0x2f);    // OR
  assert((value ^ bitmask) == 0x2d);    // XOR
  assert((value << 4) == 0x220);    // Shift left
  assert((value >> 4) == 0x02);     // Shift Right
}

class Person {
  String firstName;
}

void sampleFunctions() {
  printNumber(number) => print('The number is $number!!');
  printNumber(123);
  
  optionalParamer({device}) {
    if (?device) {
      print("Optional Paramer : $device");
    } else {
      print("Optional Paramer : $device");
    }
  }
  
  optionalParamer();
  optionalParamer(device : "windows");
  
  enableFlags({bool bold: false, bool hidden: false}) {
    print("bold:$bold, hidden : $hidden");
  }
  
  enableFlags(bold : true);
  
  String say(String from, String msg, [String device='carrier pigeon', String mood]) {
    var result = "$from says $msg";
    if (device != null) {
      result = "$result with a $device";
    }
    return result;
  }
  
  assert(say("Bob", "Howdy") == "Bob says Howdy with a carrier pigeon");
  assert(say('Bob', 'Howdy', 'smoke signal') == 'Bob says Howdy with a smoke signal');
  
  printElement(element) => print(element);
  
  // Functions as first-class objects
  var list = [1,2,3];
  list.forEach(printElement);
  
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == "!!! HELLO !!!");
  
  // Lexical closures
  Function makeAdder(num n) {
    return (num i) => n + i;
  }
  
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  assert(add2(3) == 5);
  assert(add4(3) == 7);
}

void sampleCollections() {
  var list = [1,2,3,];
  assert(list.length == 3);
  assert(list[1] == 2);
  
  var gifts = {
    'first' : 'partridge',
    'second' : 'turtledoves',
    'fifth' : 'gorlden rings',
  };
  
  var map = new Map();
  map[1] = 'partridge';
  map[2] = 'turledoves';
  map[3] = 'gorlden rings';
  
  gifts = { 'first' : 'partridge' };
  assert(gifts['first'] == 'partridge');
  assert(gifts['fifth'] == null);
  gifts['fourth'] = 'calling birds';
  assert(gifts.length == 2);
}

void sampleBooleans() {
  var fullName = '';
  assert(fullName.isEmpty);
  
  var hitPoints = 0;
  assert(hitPoints <= 0);
  
  var unicorn;
  assert(unicorn == null);
  
  var iMeantToDoThis = 0/0;
  assert(iMeantToDoThis.isNaN);
}

void sampleVariables() {
  var number = 42;
  printNumber(number);
  
  int lineCount;
  assert(lineCount == null);
  
  final name = 'Bob';
  const bar = 10000000;
  const atm = 1.01325 * bar;
  print(atm);
}

void sampleStrings() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to just use the other string delimiter.";
  
  var s = 'string interpolation';
  assert('Dart has $s, which is very handy.' == 
      'Dart has string interpolation, which is very handy.');
  assert('That deserves all caps. ${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. STRING INTERPOLATION is very handy!');
  
  s = 'String ''concatenation'
      " works even over line breaks.";
  assert(s == 'String concatenation works even over line breaks.');
  
  s1 = '''
  You can create
  multi-line strings like this one.
  ''';
  s2 = """This is also a
      multi-line string.""";
  
  print(s1);
  print(s2);
  
  s = r"In a raw string, even \n isn't specail";
  print(s);
}

void sampleNumbers() {
  
  var x = 1;
  var hex = 0xDEADBEEF;
  var bigInt = 346534658346524376592384765923749587398457294759347029438709349347;
  
  print(x);
  print(hex);
  print(bigInt);
  
  var y = 1.1;
  var exponents = 1.42e5;
  print(y);
  print(exponents);
  
  var one = int.parse("1");
  assert(one == 1);
  
  var onePointOne = double.parse("1.1");
  assert(onePointOne == 1.1);
  
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  
  String piAsString = .14159.toStringAsFixed(2);
  assert(.14159.toStringAsFixed(2) == '0.14');
  
  assert((3 << 1) == 6);
  assert((3 >> 1) == 1);
  assert((3 | 4) == 7);
}