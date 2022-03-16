import 'package:encryption_9_3/features/cisar_cypher/core/encryption_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CisarCypherController extends GetxController {
  final ValueNotifier<String> controller = ValueNotifier("1");
  String encOrDecText = "";
  String text = "";
  void encryptOrDycrypt(
    String word,
    int key,
  ) {
    encOrDecText = EncryptionManagerForCesar.calculateForAllChars(
        word, key, controller.value == "1");
    update();
  }

  void updateText(String text) {
    this.text = text;
    update();
  }

  void printDict() {
    // EncryptionManagerForCesar.dict.
  }
  @override
  void onInit() {
    controller.addListener(() {
      update();
    });
    super.onInit();
  }
}
