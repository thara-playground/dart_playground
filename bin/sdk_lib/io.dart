
import 'dart:io';

void main() {
  
  var config = new File("config.txt");
  
  config.fullPath().then(print);
  
  /* Reading a file as text */
  
  // Put the whole file in a single string.
  config.readAsString(Encoding.UTF_8).then((contents) {
    print("The entire file is ${contents.length} characters long");
  });
  
  // Put each line of the file into its own string.
  config.readAsLines(Encoding.UTF_8).then((List<String> lines) {
    print('The entire file is ${lines.length} lines long');
  });
  
  /* Reading a file as binary */
  config.readAsBytes().then((List<int> contents) {
    print('The entire file is ${contents.length} bytes long');
  });
  
  /* Handling errors */
  Future readFile = config.readAsString();
  readFile.handleException((e) {
    print(e);
    // ...Other error handling goes here...
    return true;  // We've handled the exception; no need to propagate it.
  });
  readFile.then(print);
  
  /* Streaming file contents */
  var inputStream = config.openInputStream();
  
  inputStream.onError = print;
  inputStream.onClosed = () => print('file is now closed');
  inputStream.onData = () {
    List<int> bytes = inputStream.read();
    print('Read ${bytes.length} bytes from stream');
  };
  
  /* Writing file contents */
  var logFile = new File('log.txt');
  var out = logFile.openOutputStream(FileMode.WRITE);
  out.writeString('FILE ACCESSED ${new Date.now()}');
  out.close();
  
  /* Listing files in a directory */
  var dir = new Directory("./tmp");
  
  DirectoryLister lister = dir.list(recursive:true);  // Returns immediately
  lister.onError = print;
  lister.onFile = (String name) => print('Found file $name');
  lister.onDir = (String name) => print('Found dir $name');
}
