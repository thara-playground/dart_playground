import 'dart:json';

void main() {
  
  /* Decoding JSON */
  
  // NOTE: Be sure to use double quotes ("), not single quotes('),
  // inside the JSON string. This string is JSON, not Dart.
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';
  
  var scores = JSON.parse(jsonString);
  assert(scores is List);
  
  var fisrtScore = scores[0];
  assert(fisrtScore is Map);
  assert(fisrtScore['score'] == 40);
  
  /* Encoding JSON */
  scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null},
  ];
  
  print(JSON.stringify(scores));
}