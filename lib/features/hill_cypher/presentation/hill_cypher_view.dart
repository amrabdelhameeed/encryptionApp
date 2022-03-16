import 'package:encryption_9_3/features/hill_cypher/widgets/hill_cypher_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HillCypherView extends StatelessWidget {
  const HillCypherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hill Cypher",
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
        body: HillCypherBody(),
      ),
    );
  }
}
