
main() {
  
//  simpleCompleter();
//  immediate();
//  completeException();
//  exceptionInTransform();
//  chainFuture();
//  chainFuture2();
//  waitFutures();
  
  fluent();
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
  
  final Future future = Futures.wait([
    completerA.future, completerB.future, completerC.future
  ]);
  
  future.then((List list){
    print("all futures completion!");
    list.forEach(print);
  });
  
  print("Future Completion :${future.isComplete}");
  completerA.complete("Hello, Completer A");
  print("Future Completion :${future.isComplete}");
  completerB.complete("Hello, Completer B");
  print("Future Completion :${future.isComplete}");
  completerC.complete("Hello, Completer C");
  print("Future Completion :${future.isComplete}");
}

void chainFuture2() {
  final completerA = new Completer<String>();
  final completerB = new Completer<String>();
  final transformedFuture = completerA.future.chain((x) {
    return completerB.future.transform((y) {
      return "$x, $y!!!!!!!";
    });
  });
  
  completerA.complete("Hello");
  completerB.complete("Dart");
  print(transformedFuture.value);
}

void chainFuture() {
  final completerA = new Completer<String>();
  final completerB = new Completer<String>();
  
  final chain = completerA.future.chain((x) {
    return completerB.future;
  });
  
  print("Chained Future Completion :${chain.isComplete}");
  
  completerA.complete("Hello, Completer A");
  print("Chained Future Completion :${chain.isComplete}");
  
  completerB.complete("Hello, Completer B");
  print("Chained Future Completion :${chain.isComplete}");
  
  print(chain.value);
}

void exceptionInTransform() {
  final completer = new Completer<String>();
  final future = completer.future.transform((x){ throw new Exception("oh no!"); });
  
  completer.complete("Hello, Dart!!!!");
  
  print(future.exception);
  
  try {
    print(future.value);
  } on Exception catch(e) {
    print(e);
  }
}

void completeException() {
  final completer = new Completer<String>();
  final future = completer.future.transform((x) => "** $x **");
  
  completer.completeException(new Exception("Oh no!"));
  
  print(future.isComplete ? "Completed" : "Not Yet");
  
  print(future.exception);
  
  try {
    print(future.value);
  } on Exception catch(e) {
    print(e);
  }
}

void immediate() {
  var future = new Future.immediate("Hello, Dart!!");
  
  print(future.isComplete ? "Completed" : "Not Yet");
  
  var value = null;
  future.then((x) => value = x);
  
  print(value);
}

void simpleCompleter() {
  final completer = new Completer<String>();
  final future = completer.future.transform((x) => "** $x **");
  
  print(future.isComplete ? "Completed" : "Not Yet");
  
  completer.complete("Hello, Dart!");
  
  print(future.value);
}