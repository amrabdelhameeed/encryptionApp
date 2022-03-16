import 'package:encryption_9_3/features/cisar_cypher/presentation/cisar_cypher_view.dart';
import 'package:encryption_9_3/features/hill_cypher/presentation/hill_cypher_view.dart';
import 'package:encryption_9_3/features/home_layout/data/models/button_model.dart';
import 'package:encryption_9_3/features/playfair_cypher/presentation/playfair_cypher_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kmMainColor = Color(0xff564665);
const kImagePath = "assets/images/Untitled.png";
const appTitle = "Shafrni";
const duration = Duration(milliseconds: 700);
List<ButtonModel> encryptionMethods = [
  ButtonModel(
      "Cisar Cypher",
      () => Get.to(() => CisarCypherView(),
          transition: Transition.downToUp, duration: duration)),
  // ButtonModel("Hill Cypher", () => Get.to(() => HillCypherView())),
  ButtonModel(
      "Playfair Cypher",
      () => Get.to(() => PlayfairCypherView(),
          transition: Transition.downToUp, duration: duration))
];
