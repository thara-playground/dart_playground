import 'dart:io';
import 'dart:uri';

void main() {
  var httpClient = new HttpClient();
  var conn = httpClient.getUrl(new Uri('http://127.0.0.1:8888/languages/dart'));
  conn.onResponse = (HttpClientResponse resp) {
    var input = resp.inputStream;
    input.onData = () {
      var data = input.read();
      var text = new String.fromCharCodes(data);
      print(text);
    };
    input.onClosed = () => httpClient.shutdown();
  };
}