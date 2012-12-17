
void main() {
  var names = new List<String>();
  names.addAll(["Seth", "Kathy", "Lars"]);
  print(names is List<String>); // true
  
//  names.add(42);
  
  names = <String>['Seth', 'Kathy', 'Lars'];
  var pages = <String, String> {};
  
  var views = new Map<int, String>();
}

abstract class Cache<T> {
  T getByKey(String key);
  setByKey(String key, T value);
}

