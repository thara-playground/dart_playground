import 'dart:uri';

void main() {
  
  /* Encoding and decoding fully qualified URIs */
  
  var uri = "http://example.org/api?foo=some message";
  var encoded = encodeUri(uri);
  assert(encoded == 'http://example.org/api?foo=some%20message');
  
  var decoded = decodeUri(encoded);
  assert(uri == decoded);
  
  /* Encoding and decoding URI components */
  encoded = encodeUriComponent(uri);
  assert(encoded =='http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  
  decoded = decodeUriComponent(encoded);
  assert(uri == decoded);
  
  /* Parsing URIs */
  uri = new Uri('http://example.org:8080/foo/bar#frag');
  
  assert(uri.scheme == 'http');
  assert(uri.domain == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'http://example.org:8080');
  
  /* Building URIs */
  uri = new Uri.fromComponents(
      scheme: 'http', domain: 'example.org',
      path: '/foo/bar', fragment: 'frag');
  assert(uri.toString() == 'http://example.org/foo/bar#frag');

}