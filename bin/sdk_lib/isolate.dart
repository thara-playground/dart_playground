import 'dart:isolate';

echo() {
  print("echo");
  port.receive((msg, reply) {
    reply.send('I received: $msg');
  });
}

childIsolate() {
  port.receive((msg, replyTo) {
    print('doint some work');
    if (replyTo != null) replyTo.send("shutdown");
  });
}

void main() {
  var sendPort = spawnFunction(echo);
  print("spawnFunction");
  sendPort.call("Hello from main").then((replyMsg) {
    print(replyMsg); // I received: Hello from main
  });
  
  var sender = spawnFunction(childIsolate);
  var receiver = new ReceivePort();
  receiver.receive((msg, _) {
    if (msg == 'shutdown') {
      print("shutting down");
      receiver.close();
    }
  });
  
  sender.send("do work please", receiver.toSendPort());
}