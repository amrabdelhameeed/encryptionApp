import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/core/utils/size_config.dart';
import 'package:encryption_9_3/core/widgets/custom_text_form_field.dart';
import 'package:encryption_9_3/core/widgets/my_custom_fillid_button.dart';
import 'package:encryption_9_3/core/widgets/space.dart';
import 'package:encryption_9_3/features/cisar_cypher/controller/cisar_cypher.dart';
import 'package:encryption_9_3/features/cisar_cypher/widgets/my_tab_view.dart';
import 'package:encryption_9_3/features/hill_cypher/controller/hill_cypher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HillCypherBody extends StatelessWidget {
  HillCypherBody({Key? key}) : super(key: key);
  var cont = Get.put(HillCypherController());
  TextEditingController textEditingController = TextEditingController();
  TextEditingController keyEditingController1 = TextEditingController();
  TextEditingController keyEditingController2 = TextEditingController();
  TextEditingController keyEditingController3 = TextEditingController();
  TextEditingController keyEditingController4 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HillCypherController>(
        init: HillCypherController(),
        builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: SizeConfig.defaultSize!,
                  left: 0,
                  right: 0,
                  child: CustomTabView(
                    controller: cont.controller,
                    segments: const {
                      '1': 'Encryption',
                      '2': 'Decryption',
                    },
                  ),
                ),
                // const VerticalSpace(
                //   value: 3,
                // ),
                // CustomTextFormField(
                //   textEditingController: textEditingController,
                //   maxLines: 3,
                //   label: cont.controller.value == "1"
                //       ? "Plain Text"
                //       : "Cypher Text",
                // ),
                // const VerticalSpace(
                //   value: 0,
                // ),
                // Column(
                //   children: [
                //     Container(
                //       height: 70,
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: CustomTextFormField(
                //               maxLength: 5,
                //               textEditingController: keyEditingController1,
                //               textInputType: TextInputType.number,
                //               label: "1.1",
                //             ),
                //           ),
                //           Expanded(
                //             child: CustomTextFormField(
                //               maxLength: 5,
                //               textEditingController: keyEditingController2,
                //               textInputType: TextInputType.number,
                //               label: "1.2",
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Container(
                //       height: 70,
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: CustomTextFormField(
                //               maxLength: 5,
                //               textEditingController: keyEditingController3,
                //               textInputType: TextInputType.number,
                //               label: "2.1",
                //             ),
                //           ),
                //           Expanded(
                //             child: CustomTextFormField(
                //               maxLength: 5,
                //               textEditingController: keyEditingController4,
                //               textInputType: TextInputType.number,
                //               label: "2.2",
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                // const VerticalSpace(
                //   value: 2,
                // ),
                // MyCustomFillidButton(
                //   voidBackFunction: () {
                //     int x = int.tryParse(keyEditingController1.text) ?? -1;
                //     if (x != -1) {
                //       cont.updateText(cont.controller.value == "2"
                //           ? "Plain Text"
                //           : "Cypher Text");
                //       cont.encryptOrDycrypt(textEditingController.text, x);
                //     } else {
                //       Get.showSnackbar(const GetSnackBar(
                //         message: "Numeric values only",
                //         duration: const Duration(seconds: 1),
                //       ));
                //     }
                //   },
                //   title: cont.controller.value == "1" ? "Encryp" : "Decryp",
                // ),
                // Divider(
                //   height: SizeConfig.defaultSize! * 5,
                //   thickness: 1,
                //   color: kmMainColor,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                //   child: Text(
                //     cont.text,
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w800,
                //         fontSize: SizeConfig.defaultSize! * 2.5),
                //   ),
                // ),
                // SingleChildScrollView(
                //   physics: const BouncingScrollPhysics(),
                //   child: Text(
                //     cont.encOrDecText,
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w800,
                //         fontSize: SizeConfig.defaultSize! * 1.5),
                //   ),
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: MyCustomFillidButton(
                //         voidBackFunction: () {
                //           Clipboard.setData(
                //                   ClipboardData(text: cont.encOrDecText))
                //               .then((value) {
                //             Get.showSnackbar(const GetSnackBar(
                //               message: "Saved to ClipBoard",
                //               duration: Duration(seconds: 3),
                //             ));
                //           });
                //         },
                //         title: "Copy",
                //       ),
                //     ),
                //     Expanded(
                //       child: MyCustomFillidButton(
                //         voidBackFunction: () {
                //           Share.share("Cisar Cypher : " + cont.encOrDecText)
                //               .then((value) {
                //             print("shared");
                //           });
                //         },
                //         title: "Share",
                //       ),
                //     ),
                //   ],
                // ),
                // VerticalSpace(
                //   value: 2,
                // )
              ],
            ),
          );
        });
  }
}
