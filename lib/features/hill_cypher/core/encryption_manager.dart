import 'package:characters/src/extensions.dart';

class EncryptionManagerForHill {
  static String calculateForAllChars(String word, int key, bool isEnc) {
    List<String> strings = [];
    //encrypt or decrypt (depends on bool -> isEnc) for each character
    for (var ch in word.characters) {
      strings.add(calculateForOneChar(ch, key, isEnc));
    }
    //convert list of String to String
    return strings.join("");
  }

  static String calculateForOneChar(String char, int key, bool isEnc) {
    //Convert char to upperCase then to UTF-16
    int UTF_16_char = char.toUpperCase().codeUnitAt(0);
    //if isEnc = true -> encryprt the char
    if (isEnc) {
      //add the key
      UTF_16_char = UTF_16_char + key;
      //get mod 26 (65 is UTF-16 for 'A')
      UTF_16_char = (UTF_16_char - 65).remainder(26) + 65;
    }
    //else -> isEnc = false -> decrypt the char
    else {
      //subtract the key
      UTF_16_char = UTF_16_char - key;
      //get mod 26 (90 is UTF-16 for 'Z')
      UTF_16_char = (UTF_16_char - 90).remainder(26) + 90;
    }
    //if the char is just a space so return space (don't encrypt/decrypt the space)
    if (char == " ") {
      return " ";
    }
    //Convert UTF-16 to Char
    return String.fromCharCode(UTF_16_char);
  }
}
