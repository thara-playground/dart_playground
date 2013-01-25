library minin_sample;

main () {
  
}

class Account {
  int balance = 100;
  
  void decrease(int amount) {
    balance -= amount;
  }
  
  void increase(int amount) {
    balance += amount;
  }
}

class Role<T> {
  
  
  
}

//class Source extends Role<Account> with Account {
//  
//  void transferTo(Sink sink, int amount) {
//    withdraw(amount);
//    sink.deposit(amount);
//  }
//  
//  void withdraw(int amount) {
//    decrease(amount);
//  }
//  
//}
//
//class Sink extends Role<Account> with Account {
//  
//  void transferFrom(Source src, int amount) {
//    src.withdraw(amount);
//    deposit(amount);
//  }
//  
//  void deposit(int amount) {
//    increase(amount);
//  }
//}