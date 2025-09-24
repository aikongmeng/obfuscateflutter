import 'dart:io';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
const _firstChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
Set<String> genRandomKeys(int keysLength) {
  var keys = <String>{};

  for (int i = 0; keys.length < keysLength; i++) {
    var keyCharLength = Random().nextInt(12) + 3;
    String randomKey = genRandomKey(keyCharLength);

    keys.add(randomKey);
  }

  return keys;
}

String genRandomKey(int keyCharLength) {
  String randomKey = '';
  randomKey += _firstChars[Random().nextInt(_firstChars.length)];
  for (int j = 1; j < keyCharLength; j++) {
    randomKey += _chars[Random().nextInt(_chars.length)];
  }
  return randomKey;
}

genAndroidProguardDict(String flutterProjectPath) {
  File progardDict = File('dict.txt');

  var keys = genRandomKeys(10000);
  progardDict.writeAsStringSync(keys.join("\n"),
      flush: true, mode: FileMode.write);

  print("android proguard dict create finished! path ->  dict.txt");
}

void main(List<String> arguments) async {
  genAndroidProguardDict('test');
}
