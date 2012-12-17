
void main() {
  
  // Instance variables
  var point = new Point(1, null);
  point.x = 4;
  assert(point.x == 4);
  assert(point.y == null);
  
  // Constructors
  var dc = new PointDefaultConstructor();
  
  var p = new Point.fromJson({"x": 123, "y":987});
  var emp = new Employee.fromJson({});
  
  ImmutablePoint origin = const ImmutablePoint(0, 0);
  
  var logger = new Logger("UI");
  logger.log("Button clicked");
}

class PointDefaultConstructor {
  num x;
  num y;
}
class Point {
  num x;
  num y;
  num z = 0;
  
  //  The main constructor for this class.
  Point(this.x, this.y);
  
  // Named constructor
  Point.fromJson(Map json) : x = json['x'], y = json['y'] {
    print("In Point.fromJson(): ($x, $y)");
  }
  
  // Delegates to the main constructor.
  Point.alongXAxis(num x) : this(x, 0);
}

class Person {
  Person.fromJson(Map data) {
    print("in Person");
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print("in Employee");
  }
}

class ImmutablePoint {
  final num x;
  final num y;
  // Constant constructors
  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;
  
  static final Map<String, Logger> _cache = <String, Logger>{};
  
  // Factory constructors
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      var logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  
  Logger._internal(this.name);
  
  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}