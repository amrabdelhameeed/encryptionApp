// ignore_for_file: non_constant_identifier_names

import 'package:encryption_9_3/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController keyEditingController = TextEditingController();
  String encryptionValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Encryption/Decryption Cesar Cipher"),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxLength: 30,
                hint: "Input Your Cipher Text",
                label: "Cipher Text",
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hint: "Input Your Key",
                label: "Key",
                textEditingController: keyEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      int num = int.tryParse(keyEditingController.text) ?? -1;
                      if (num != -1) {
                        setState(() {
                          encryptionValue = calculateForAllChars(
                              textEditingController.text, num, true);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please Input a numerical key")));
                      }
                    },
                    child: const Text("Encrypt")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      int num = int.tryParse(keyEditingController.text) ?? -1;
                      if (num != -1) {
                        setState(() {
                          encryptionValue = calculateForAllChars(
                              textEditingController.text, num, false);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please input a numerical key")));
                      }
                    },
                    child: const Text("Decrypt")),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                encryptionValue,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String calculateForAllChars(String word, int key, bool isEnc) {
  List<String> strings = [];
  //encrypt or decrypt (depends on bool -> isEnc) for each character
  for (var ch in word.characters) {
    strings.add(calculateForOneChar(ch, key, isEnc));
  }
  //convert list of String to String
  return strings.join("");
}

String calculateForOneChar(String char, int key, bool isEnc) {
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
