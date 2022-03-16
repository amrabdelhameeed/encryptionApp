import 'package:characters/src/extensions.dart';

class EncryptionManagerForPlayfair {
  static String playFairCalculate(
      {required String word, required String key, required bool isEnc}) {
    key = key.toUpperCase();
    word = word.toUpperCase();
    List<String> keyList = key.split("");
    List<String> alphabts =
        List<String>.generate(26, (index) => String.fromCharCode(index + 65));
    keyList.addAll(alphabts);
    keyList = Set.from(keyList).toList().cast<String>();
    var n = 5;
    var m = (keyList.length / n).round();
    var lists = List.generate(
        n,
        (i) => keyList.sublist(
            m * i, (i + 1) * m <= keyList.length ? (i + 1) * m : null));
    // lists[4][4] =
    //     "(${keyList[keyList.length - 2] + "/" + keyList[keyList.length - 1]})";
    if (word.length % 2 != 0) {
      String x = "X";
      if (word.characters.last == "X") {
        x = "Y";
      }
      StringBuffer k = StringBuffer(word);
      k.write(x);
      word = k.toString();
    }
    for (var i = 0; i < word.characters.length; i++) {
      if ((i + 1) % 2 == 0) {
        if (word.characters.toList()[i] == word.characters.toList()[i - 1]) {
          word = word.replaceRange(i, i + 1, "X");
        }
      }
    }
    // ///////////////////////////////////////////
    List<List<int>> indexes = [];
    for (var ch in word.characters) {
      for (var i = 0; i < lists.length; i++) {
        int x = lists[i].indexOf(ch);
        if (x != -1) {
          indexes.add([i, x]);
        }
      }
    }
    ////////////////////// indexes
    StringBuffer encOrDecWord = StringBuffer("");
    for (var i = 0; i < indexes.length; i++) {
      if ((i + 1) % 2 == 0) {
        // nafs el saf
        if (indexes[i][0] == indexes[i - 1][0]) {
          if (isEnc) {
            encOrDecWord
                .write(lists[indexes[i - 1][0]][(indexes[i - 1][1] + 1) % 5]);
            encOrDecWord.write(lists[indexes[i][0]][(indexes[i][1] + 1) % 5]);
          } else {
            encOrDecWord
                .write(lists[indexes[i - 1][0]][(indexes[i - 1][1] - 1) % 5]);
            encOrDecWord.write(lists[indexes[i][0]][(indexes[i][1] - 1) % 5]);
          }
          // print(encOrDecWord.toString());
        }
        // nafs el 3amood
        else if (indexes[i][1] == indexes[i - 1][1]) {
          if (isEnc) {
            encOrDecWord
                .write(lists[(indexes[i - 1][0] + 1) % 5][indexes[i - 1][1]]);
            encOrDecWord.write(lists[(indexes[i][0] + 1) % 5][indexes[i][1]]);
          } else {
            encOrDecWord
                .write(lists[(indexes[i - 1][0] - 1) % 5][indexes[i - 1][1]]);
            encOrDecWord.write(lists[(indexes[i][0] - 1) % 5][indexes[i][1]]);
          }
        }
        // mo5talfeen
        else {
          encOrDecWord.write(lists[indexes[i - 1][0]][indexes[i][1]]);
          encOrDecWord.write(lists[indexes[i][0]][indexes[i - 1][1]]);
        }
      }
    }
    return encOrDecWord.toString();
  }
}
