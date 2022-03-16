import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/core/utils/size_config.dart';
import 'package:encryption_9_3/core/widgets/custom_text_form_field.dart';
import 'package:encryption_9_3/core/widgets/my_custom_fillid_button.dart';
import 'package:encryption_9_3/core/widgets/space.dart';
import 'package:encryption_9_3/features/cisar_cypher/controller/cisar_cypher.dart';
import 'package:encryption_9_3/features/cisar_cypher/widgets/my_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CisarCypherBody extends StatelessWidget {
  CisarCypherBody({Key? key}) : super(key: key);
  var cont = Get.put(CisarCypherController());
  TextEditingController textEditingController = TextEditingController();
  TextEditingController keyEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CisarCypherController>(
        init: CisarCypherController(),
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(
                value: 2,
              ),
              CustomTabView(
                controller: cont.controller,
                segments: const {
                  '1': 'Encryption',
                  '2': 'Decryption',
                },
              ),
              const VerticalSpace(
                value: 2,
              ),
              CustomTextFormField(
                textEditingController: textEditingController,
                maxLines: 6,
                label:
                    cont.controller.value == "1" ? "Plain Text" : "Cypher Text",
              ),
              const VerticalSpace(
                value: 2,
              ),
              CustomTextFormField(
                maxLength: 17,
                textEditingController: keyEditingController,
                textInputType: TextInputType.number,
                label: "Key",
              ),
              const VerticalSpace(
                value: 2,
              ),
              MyCustomFillidButton(
                voidBackFunction: () {
                  int x = int.tryParse(keyEditingController.text) ?? -1;
                  if (x != -1) {
                    cont.updateText(cont.controller.value == "2"
                        ? "Plain Text"
                        : "Cypher Text");
                    cont.encryptOrDycrypt(textEditingController.text, x);
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      message: "Numeric values only",
                      duration: const Duration(seconds: 1),
                    ));
                  }
                },
                title: cont.controller.value == "1" ? "Encryp" : "Decryp",
              ),
              Divider(
                height: SizeConfig.defaultSize! * 3,
                thickness: 1,
                color: kmMainColor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                ),
                child: Text(
                  cont.text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 8.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      cont.encOrDecText,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.defaultSize! * 1.5),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyCustomFillidButton(
                      voidBackFunction: () {
                        Clipboard.setData(
                                ClipboardData(text: cont.encOrDecText))
                            .then((value) {
                          Get.showSnackbar(const GetSnackBar(
                            message: "Saved to ClipBoard",
                            duration: Duration(seconds: 3),
                          ));
                        });
                      },
                      title: "Copy",
                    ),
                  ),
                  Expanded(
                    child: MyCustomFillidButton(
                      voidBackFunction: () {
                        Share.share("Cisar Cypher : " + cont.encOrDecText)
                            .then((value) {
                          print("shared");
                        });
                      },
                      title: "Share",
                    ),
                  ),
                ],
              ),
              const VerticalSpace(
                value: 2,
              )
            ],
          );
        });
  }
}
