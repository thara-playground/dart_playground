
import 'dart:async';

main() {
  
  simpleCompleter();
  immediate();
  completeException();
  exceptionInTransform();
  chainFuture();
  chainFuture2();
  
  fluent();
  waitFutures();
}

void fluent() {
  final completer = new Completer<String>();
  final future = completer.future;
  
  future
    ..then((x) {print("step 1: $x");})
    ..then((x) {print("step 2: $x");})
    ..then((x) {print("step 3: $x");});
  
  completer.complete("Hello, Darts!");
}

void waitFutures() {
  final completerA = new Completer<String>();
  final completerB = new Completer<String>();
  final completerC = new Completer<String>();
  
  final Future future = Future.wait([
    completerA.future, completerB.future, completerC.future
  ]);
  
  future.then((List list){
    print("all futures completion!");
    list.forEach(print);
  });
  
  completerA.complete("Hello, Completer A");
  completerB.complete("Hello, Completer B");
  completerC.complete("Hello, Completer C");
}

void chainFuture2() {
  final completerA = new Completer<String>();
  final completerB = new Completer<String>();
  final transformedFuture = completerA.future.then((x) {
    return completerB.future.then((y) {
      return "$x, $y!!!!!!!";
    });
  });
  
  completerA.complete("Hello");
  completerB.complete("Dart");
  transformedFuture.then(print);
}

void chainFuture() {
  final completerA = new Completer<String>();
  final completerB = new Completer<String>();
  
  final chain = completerA.future.then((x) {
    return completerB.future;
  });
  
  completerA.complete("Hello, Completer A");
  completerB.complete("Hello, Completer B");
  chain.then(print);
}

void exceptionInTransform() {
  final completer = new Completer<String>();
  final future = completer.future.then((x){ throw new Exception("oh no!"); });
  
  completer.complete("Hello, Dart!!!!");
  
  future.catchError(print);
  
  try {
    future.then(print);
  } on Exception catch(e, s) {
    print(s);
  }
}

void completeException() {
  final completer = new Completer<String>();
  final future = completer.future.then((x) => "** $x **");
  
  completer.completeError(new Exception("Oh no!"));
  
  future.catchError(print);
  
  try {
    future.then(print);
  } on Exception catch(e) {
    print(e);
  }
}

void immediate() {
  var future = new Future.immediate("Hello, Dart!!");
  
  var value = null;
  future.then((x) => value = x);
  
  print(value);
}

void simpleCompleter() {
  final completer = new Completer<String>();
  final future = completer.future.then((x) => "** $x **");
  
  completer.complete("Hello, Dart!");
  
  future.then(print);
}