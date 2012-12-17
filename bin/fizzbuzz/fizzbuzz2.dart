
fizz(i) => i % 3 == 0 ? "Fizz" : "";
buzz(i) => i % 5 == 0 ? "Buzz" : "";

main() {
  
  final limit = 100;
  
  withoutMod(limit);
  
  withoutForLoop(limit);
}

void withoutForLoop(int limit) {
  var src = [0];
  
  src.reduce(null, (dummy, i) {
    if (i != limit) src.add(i + 1);
    return src;
  }).map((i) {
    var sb = new StringBuffer()
                  .add(i % 3 == 0 ? "Fizz" : "")
                  .add(i % 5 == 0 ? "Buzz" : "");
    return sb.isEmpty ? "${i}" : sb.toString();
  }).forEach(print);
}

void withoutMod(int limit) {
  
  var fizz = 3;
  var buzz = 5;
  
  for (var i = 1; i <= limit; i++) {
    var sb = new StringBuffer();
    if (i == fizz) {
      sb.add("Fizz");
      fizz += 3;
    }
    if (i == buzz) {
      sb.add("Buzz");
      buzz += 5;
    }
    print(sb.isEmpty ? "$i" : sb.toString());
  }
}