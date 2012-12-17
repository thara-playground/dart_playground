
import "dart:math";

void main() {
  
  var rect = new Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
  
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);
  
  assert(v.x ==2 && v.y == 3);              // v == (2,3)
  assert((v + w).x == 4 && (v + w).y == 5); // v+w == (4,5)
  assert((v - w).x == 0 && (v - w).y == 1); // v-w == (0,1)
  
  AbstractContainer ac = new AbstractContainer();
  SpecializedContainer sc = new SpecializedContainer();
//  sc.doSomething();
  
  greetBob(Person person) => person.greet("bob");
  print(greetBob(new Person("kathy")));
  print(greetBob(new Imposter()));
}

class Point {
  num x;
  num y;
  Point(this.x, this.y);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

}

class Rectangle {
  num left;
  num top;
  num width;
  num height;
  
  Rectangle(this.left, this.top, this.width, this.height);
  
  // Getters and setters
  num get right             => left + width;
      set right(num value)  => left = value - width;
      
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;
}

abstract class Doer {
  
  // Define an abstract method.
  void doSomething();
}

class EffectiveDoer extends Doer {
  
  void doSomething() {
    // Provide an implementation, so the method is not abstact in this class.
  }
}

class Vector {
  final int x;
  final int y;
  
  const Vector(this.x, this.y);
  
  // Overrides + (a + b)
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }
  
  // Override - (a - b)
  Vector operator -(Vector v) {
    return new Vector(x -v.x, y - v.y);
  }
}

// This class is declared abstarct and thus can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, field, method...
  
  AbstractContainer._();
  
  factory AbstractContainer() {
    return new SpecializedContainer();
  }
  
  
  // Abstract Method
  void updateChildren();
}

class SpecializedContainer extends AbstractContainer {
  
  SpecializedContainer() : super._();
  
  void updateChildren() {
    // Implement updateChildren
  }
  
  void doSomething(); // Abstract method causes a warning but doesn't prevent instantiatation.
}

// A person. The implicit interface contains greet()
class Person {
  final _name;  // In the interface, but visible only in this library, thanks to _.
  Person(this._name); // Not in the interface
  String greet(who) => "Hello, $who. I am $_name."; // In the interface
}

class Imposter implements Person {
  final _name = ""; // we have to define this, but we don't use it.
  String greet(who) => "Hi $who. Do you know who I am?";  
}

