import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/core/utils/size_config.dart';
import 'package:encryption_9_3/features/cisar_cypher/widgets/cisar_cypher_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CisarCypherView extends StatelessWidget {
  const CisarCypherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cisar Cypher",
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
        body: CisarCypherBody(),
      ),
    );
  }
}
