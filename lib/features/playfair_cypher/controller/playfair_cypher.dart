import 'package:encryption_9_3/features/cisar_cypher/core/encryption_manager.dart';
import 'package:encryption_9_3/features/playfair_cypher/core/encryption_manager_playfair.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlayfairCypherController extends GetxController {
  final ValueNotifier<String> controller = ValueNotifier("1");
  String encOrDecText = "";
  String text = "";
  void encryptOrDycrypt(
    String word,
    String key,
  ) {
    encOrDecText = EncryptionManagerForPlayfair.playFairCalculate(
        isEnc: controller.value == "1", word: word, key: key);
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
