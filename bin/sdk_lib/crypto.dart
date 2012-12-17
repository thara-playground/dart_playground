import 'dart:crypto';
import 'dart:io';

main() {
  
  /* Generating cryptographic hashes */
  var sha256 = new SHA256();
  var digest = sha256.update('message'.charCodes).digest();
  var hexString = CryptoUtils.bytesToHex(digest);
  print(hexString);
  
  /* Generating message authentication codes */
  var hmac = new HMAC(new SHA256(), 'secretkey'.charCodes);
  var hmacDigest = hmac.update('message'.charCodes).digest();
  var hmacHex = CryptoUtils.bytesToHex(hmacDigest);
  print(hmacHex);
  
  /* Generating Base64 strings */
  var file = new File('icon.ico');
  var bytes = file.readAsBytesSync();
  var base64 = CryptoUtils.bytesToBase64(bytes);
  print(base64);
}
