
library fizzbuzz;

typedef void Print(String str);

void main() {
  
  var limit = 100;
  
//  for (var i = 1; i <= limit; i++) {
//    var sb = new StringBuffer();
//    if (i % 3 == 0) {
//      sb.add("Fizz");
//    }
//    if (i % 5 == 0) {
//      sb.add("Buzz");
//    }
//    print(sb.isEmpty ? "${i}" : sb.toString());
//  }
//  
//  // functional
//  fizz(i) => i % 3 == 0 ? "Fizz" : "";
//  buzz(i) => i % 5 == 0 ? "Buzz" : "";
//  for (var i = 1; i <= limit; i++) {
//    var sb = new StringBuffer().add(fizz(i)).add(buzz(i));
//    print(sb.isEmpty ? "${i}" : sb);
//  }
//  
//  // functional 2
//  for (var i = 1; i <= limit; i++) {
//    var sb = new StringBuffer()
//                  .add(i % 3 == 0 ? "Fizz" : "")
//                  .add(i % 5 == 0 ? "Buzz" : "");
//    print(sb.isEmpty ? "${i}" : sb);
//  }
//  
//  // recursive function
//  fizzbuzz(i, Print fn) {
//    if (i == 0) return;
//    fizzbuzz(i - 1, fn);
//    var sb = new StringBuffer()
//                  .add(i % 3 == 0 ? "Fizz" : "")
//                  .add(i % 5 == 0 ? "Buzz" : "");
//    fn(sb.isEmpty ? "${i}" : sb);
//  }
//  
//  fizzbuzz(limit, print);
  
  // Iterator
  new List.from(new FizzBuzzIterable(limit)).forEach(print);
}

class FizzBuzzIterable implements Iterable<String> {
  
  final int limit;
  FizzBuzzIterable(this.limit);
  
  Iterator<String> get iterator {
    return new FizzBuzzIterator(this.limit);
  }
}

class FizzBuzzIterator implements Iterator<String> {
  final int limit;
  int _current;
  
  FizzBuzzIterator(this.limit) : _current = 1;
  
  String get current {
    var sb = new StringBuffer()
                  ..add(this._current % 3 == 0 ? "Fizz" : "")
                  ..add(this._current % 5 == 0 ? "Buzz" : "");
    String str = sb.isEmpty ? "${this._current}" : sb.toString();
    this._current++;
    return str;
  }
  
  bool moveNext() => _current <= this.limit;
}