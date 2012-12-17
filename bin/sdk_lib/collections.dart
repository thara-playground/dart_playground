
void main() {
  
  sampleList();
  
  sampleSet();
  
  sampleCommonCollectionMethods();
  
  // Map Literals use strings as keys.
  var hawaiianBeaches = {
    'oahu' : ["waikiki", "kailua", "waimanalo"],
    'big island' : ['wailea bay', "pololu beach"],
    "kauai" : ["hanalei", "poipu"]
  };
  
  // Maps can be built from a constructor.
  var searchTerms = new Map();
  
  // Maps are parameterized types; you can speciy with types the key and value should be.
  var nobleGases = new Map<int, String>();

  // Maps from constructors can use any object as a key.
  // Integers and strings are common key types.
  nobleGases[54] = "xenon";
  
  // Retrieve a value withe a key.
  assert(nobleGases[54] == "xenon");
  
  // Check whether a map contains a key.
  assert(nobleGases.containsKey(54));
  
  // Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  
  // Get all the keys as an unordered collection (a list).
  var keys = hawaiianBeaches.keys;  // getKeys() is old. ********************

  assert(keys.length == 3);
  assert(keys.contains("oahu"));
  //assert(new Set.from(keys).contains("oahu"));
  
  // Get all the valeus as unordered collection (a list or lists).
  var values = hawaiianBeaches.values;  // getValeus() is old. ********************
  assert(values.length == 3);
  assert(values.some((v) => v.indexOf("waikiki") != -1));
  
  // NOTE: Do not depend on iteration order.
  hawaiianBeaches.forEach((k, v) {
    print("I want to visit $k and swim at $v");
    // Iwant to visit oahu and swim at [waikiki, kailua, waimanolo], etc...
  });
  
  assert(hawaiianBeaches.containsKey("oahu"));
  assert(!hawaiianBeaches.containsKey("florida"));
  
  pickToughestKids(name) {
    print(name);
    return "";
  }
  
  var teamAssignments = {};
  teamAssignments.putIfAbsent("Catcher", () => pickToughestKids("A"));
  teamAssignments.putIfAbsent("Catcher", () => pickToughestKids("B"));  // this is not printed.
  assert(teamAssignments['Catcher'] != null);
}

void sampleCommonCollectionMethods() {
  var teas = ["green", "black", "chamomile", "earl grey"];
  assert(!teas.isEmpty);
  
  teas.forEach((tea) => print("I dring $tea"));
  
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  assert(loudTeas.some((tea) => tea == "GREEN"));
  
  // Chamomile is not caffeinated.
  isDecaffeinated(String teaName) => teaName == "chamomile";
  
  // Use filter() to create a new collection with only the items that return true from the provided function.
  var decaffeinatedTeas = teas.filter((tea) => isDecaffeinated(tea));
  // or teas.filter(isDecaffeinated)
  
  // Use some() to check whether at least one item in the collection satisfies a condition.
  assert(teas.some(isDecaffeinated));
  
  // Use every() to check whether all the items in a collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}

void sampleSet() {
  var ingredients = new Set();
  ingredients.addAll(["gold", "titanium", "xenon"]);
  assert(ingredients.length == 3);
  
  // Adding a duplicate item has no effect.
  ingredients.add("gold");
  assert(ingredients.length == 3);
  
  // Remove an item from a set.
  ingredients.remove("gold");
  assert(ingredients.length == 2);
  
  ingredients.clear();
  ingredients.addAll(["gold", "titanium", "xenon"]);
  
  // Check whether an item is in the set.
  assert(ingredients.contains("titanium"));
  
  // Check whether all the items are in the set.
  assert(ingredients.containsAll(["titanium", "xenon"]));
  
  ingredients.clear();
  ingredients.addAll(["gold", "titanium", "xenon"]);
  
  // Create the intersection of two sets.
  var nobleGases = new Set.from(["xenon", "argon"]);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains("xenon"));
  
  // Check whether this set is a subset of another collection.
  // That is, does another collection contains all the items of this set?
  var allElements = ["hydrogen", "helium", "lithium", "beryllium", "gold", "titanium", "xenon" /* all the rest */];
  assert(ingredients.isSubsetOf(allElements));
}

void sampleList() {
  // Use a List constructor.
  var vegetables = new List();
  
  // Or simply use a list literal.
  var fruits = ["apples", "oranges"];
  
  // Add to a list.
  fruits.add("kiwis");
  // Add multiple items to a list.
  fruits.addAll(["grapes", "bananas"]);
  
  // Get the list length.
  assert(fruits.length == 5);
  
  // Remove a single item.
  var appleIndex = fruits.indexOf("apples");
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  
  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.length == 0);
  assert(fruits.isEmpty);
  
  
  fruits = ["apples", "oranges"];
  
  // Access a list item by index.
  assert(fruits[0] == "apples");
  
  // Find an item in a list.
  assert(fruits.indexOf("apples") == 0);
  
  fruits = ["bananas", "apples", "oranges"];
  
  // Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == "apples");
  
  // The list should contain only strings.
  fruits = new List<String>();
  
  fruits.add("apples");
  var fruit = fruits[0];
  assert(fruit is String);
  
  // Generates static analysis warning, num is not a string.
  //fruits.add(5);  // BAD: Throws exception in checked mode.
}