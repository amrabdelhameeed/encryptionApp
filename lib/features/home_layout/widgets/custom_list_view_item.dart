import 'package:encryption_9_3/core/widgets/my_custom_fillid_button.dart';
import 'package:encryption_9_3/features/home_layout/data/models/button_model.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key, this.model}) : super(key: key);
  final ButtonModel? model;
  @override
  Widget build(BuildContext context) {
    return MyCustomFillidButton(
      title: model!.methodName,
      voidBackFunction: model!.methodFunction,
    );
  }
}
