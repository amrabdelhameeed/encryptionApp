import 'package:encryption_9_3/features/playfair_cypher/widgets/playfair_cypher_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayfairCypherView extends StatelessWidget {
  const PlayfairCypherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Playfair Cypher",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: PlayfairCypherBody(),
      ),
    );
  }
}
