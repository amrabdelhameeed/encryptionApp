import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:encryption_9_3/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyCustomFillidButton extends StatelessWidget {
  const MyCustomFillidButton({Key? key, this.title, this.voidBackFunction})
      : super(key: key);
  final VoidCallback? voidBackFunction;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidBackFunction,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: kmMainColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.grey.shade700,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kmMainColor, width: 3)),
        height: 60,
        width: SizeConfig.screenWidth,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
