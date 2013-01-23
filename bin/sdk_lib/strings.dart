
void main() {
  
  // Searching inside a string
  
  // Check whether a string contains another string.
  assert("Never odd or event".contains("odd"));
  
  // Does a string start with another strings?
  assert("Never odd or even".startsWith("Never"));
  
  // Does a string end with another string?
  assert("Never odd or even".endsWith("even"));
  
  // Find the location of a string inside a string.
  assert("Never odd or even".indexOf("odd") == 6);
  
  
  // Extracting data from a string
  
  // Grab a substring.
  assert("Never odd or even".substring(6, 9) == "odd");
  
  // Split a string using a string pattern.
  var parts = "structured web apps".split(" ");
  assert(parts.length == 3);
  assert(parts[0] == "structured");
  
  // Get the character (as a string) by index.
  assert("Never odd or even"[0] == "N");
  
  // Using splitChars() to get a list of all characters (as Strings).
  // good for iterating.
  for (var char in "hello".splitChars()) {
    print(char);
  }
  
  // Get the char code at an index.
  assert("Never odd or even".charCodeAt(0) == 78);
  
  // Get all the char codes as a list of integers.
  var charCodes = "Never odd or even".charCodes;
  assert(charCodes.length == 17);
  assert(charCodes[0] == 78);
  
  
  // Converting to uppercase or lowercase
  
  // Convert to uppercase.
  assert("structured web apps".toUpperCase() == "STRUCTURED WEB APPS");
  
  // Convert to lowercase.
  assert("STRUCTURED WEB APPS".toLowerCase() == "structured web apps");
  
  
  // Trimming and empty strings
  
  // Trim a string.
  assert("     hello     ".trim() == "hello");
  
  // Check whether a string is empty.
  assert("".isEmpty);
  
  // Strings with only white space are not empty.
  assert(!"   ".isEmpty);
  
  
  // Replacing part of a string
  var greetingTemplate = "Hello, NAME!";
  var greeting = greetingTemplate.replaceAll(new RegExp("NAME"), "Bob");
  
  assert(greeting != greetingTemplate);
  
  
  // Building a string
  var sb = new StringBuffer();
  
  sb.add("Use a StringBuffer ");
  sb.addAll(["for ", "efficient ", "string ", "creation "]);
  sb..add("if you are ")..add("building lots of strings.");
  
  var fullString = sb.toString();
  
  assert(fullString ==
      "Use a StringBuffer for efficient string creation "
      "if you are building lots of strings.");
  
  sb.clear(); // All gone!
  assert(sb.toString() == "");
  
  
  // Regular expressions
  
  // A regular expression for one or more digits *****************
  var numbers = new RegExp(r"\d+");
  
  var allCharacters = "llamas live fifteen to twenty years";
  var someDigits = "llamas live 15 to 20 years";
  
  // Contains() can use a regular expression
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  
  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, "XX");
  assert(exedOut == "llamas live XX to XX years");
  
  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));
  
  // Loop through all matchers
  for (var match in numbers.allMatches(someDigits)) {
    print(match.group(0));  // 15, then 20
  }
}
