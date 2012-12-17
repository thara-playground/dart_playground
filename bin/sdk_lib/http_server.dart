import 'dart:io';

void main() {
  
  dartHandler(HttpRequest request, HttpResponse response) {
    print('New request');
    response.outputStream.writeString('Dart is optionally typed');
    response.outputStream.close();
  }
  
  var httpServer = new HttpServer();
  httpServer.addRequestHandler(
      (req) => req.path == '/languages/dart',
      dartHandler);
  
  httpServer.listen('127.0.0.1', 8888);
}