typedef F(bool x);

void main() {
  f(int x) => x;
  
  if (f is F) {
    print("yoyoma");
  }
  
  print(f is F ? "A" : "B");
  
}

class I<T extends num> {
  
}

class J{}

class A<T extends num> implements J, I<T> {
}

//I x = new A<String>();

I x = new A<int>();