import 'package:characters/src/extensions.dart';

class EncryptionManagerForCesar {
  static String calculateForAllChars(String word, int key, bool isEnc) {
    final List<String> alphabts =
        List<String>.generate(26, (index) => String.fromCharCode(index + 65));
    StringBuffer encOrDecWord = StringBuffer("");
    word.toUpperCase().characters.forEach((charOfWord) {
      int index =
          (alphabts.indexWhere((alphapitChar) => alphapitChar == charOfWord));
      isEnc ? index = (index + key) % 26 : index = (index - key) % 26;
      charOfWord == " "
          ? encOrDecWord.write(" ")
          : encOrDecWord.write(alphabts[index]);
    });
    return encOrDecWord.toString();
  }
}
