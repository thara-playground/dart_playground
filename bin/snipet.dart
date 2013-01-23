import 'package:intl/intl.dart';

typedef Check<T>(T value, [onError(T value)]);

main () {
  
  print(toDate(["20121012"]));
  
  List<Check> checks = [
    (str, [onError(value)]) => str != null,
    (str, [onError(value)]) => !str.isEmpty
  ];
  
  Check<String> doCheck = (String value, [onError(String)]) {
    
    var s = (Check check) {
      if (?onError) {
        check(value, onError);
      } else {
        check(value);
      }
    };
    
    s(checks[0]);
    
//    checks.forEach((Check check) {
//      if (?onError) {
//        check(value, onError);
//      } else {
//        check(value);
//      }
//    });
  };
  
  doCheck("10");

  Check ch2 = (String str, [onError(String)]) {
    if (str != null) ?onError ? onError(str) : print("non callback") ;
  };
  
  Check ch = (String value, [onError(String)]) {
    if (?onError) {
      ch2(value, onError);
    } else {
      ch2(value);
    }
  };
  
  ch("abc");
//  doCheck("10");  
}

List<Date> toDate(List<String> dateStrings, [onError(String)]) {
  var df = new DateFormat("yyyyMMdd");
  return dateStrings.map((str) {
    try {
      return df.parse(str);
    } catch(e) {
      if (onError != null) {
        onError(str);
      } else {
        throw e;
      }
    }
  });
}