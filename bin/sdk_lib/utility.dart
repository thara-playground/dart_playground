


void main() {
  
  // Comparing
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
  
  // Implementing map keys
  var p1 = new Person("bob", "smith");
  var p2 = new Person("bob", "smith");
  assert(p1.hashCode == p2.hashCode);
  
  var map = new Map();
  map[p1] = "S";
  map[p2] = "S";
  assert(map.length == 1);
  
  // Iteration
  // Objects that implement Iterable can be used with for-in.
  for (var process in new Processes()) {
    // Do something with the process.
  }
  
  // Asynchronous programming
  Future<bool> longExpensiveSearch() {
    var completer = new Completer();
    // Perform exhaustive search.
    // ...
    // Sometime later,
    // found it!!
    completer.complete(true);
    return completer.future;
  }
  
  var result = longExpensiveSearch(); // return immediately.
  
  // result.then() returns immediately.
  result.then((success) {
    // The following code executes when the operation is complete.
    print("The item was found: $success");
  });
  
  // Chaining multiple asynchronous methods
  result = longExpensiveSearch();
  result.handleException((exception) => print("DOH!"));
  
  result
    .chain((value) {
      var completer = new Completer();
      completer.complete("AAA");
      return completer.future;
    })
    .chain((value) {
      var completer = new Completer();
      completer.complete("BBB");
      return completer.future;
    })
    .then((value) => print("done!"));
  
  // Waiting for multiple futures
  Futures.wait([result, result, result]).then((List values) {
    print("Done with all the long steps.");
  });
}

class Line implements Comparable {
    final length;
    const Line(this.length);
    int compareTo(Line other) => this.length - other.length;
}

class Person {
  String firstName, lastName;
  
  Person(this.firstName, this.lastName);
  
  // Override hashCode using strategy from Effective Java, Chapter 11.
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }
  
  // Always implement operator== if you override hashCode.
  bool operator== (other) {
    if (identical(other, this)) return true;
    return (other.firstName == this.firstName && other.lastName == lastName);
  }
}

class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  
  Process next() {
    // Return the next process if possiblel but if not:
    throw new StateError("Bad state: No more elements");
  }
  
  bool get hasNext {
    // True if calling next() would return a process
    return false;
  }
}

// A mythical class lets you iterate through all processes.
class Processes implements Iterable<Process> {
  Iterator<Process> iterator() {
    return new ProcessIterator();
  }
}
