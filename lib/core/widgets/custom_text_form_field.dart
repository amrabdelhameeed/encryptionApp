import 'package:encryption_9_3/core/constants/strings.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.maxLines,
      this.onChanged,
      this.onSaved,
      this.suffixIcon,
      this.textInputType,
      this.hint,
      this.label,
      this.maxLength,
      this.textEditingController})
      : super(key: key);
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final TextEditingController? textEditingController;
  final String? hint;
  final String? label;
  final int? maxLength;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        maxLength: maxLength ?? 1000000,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a value";
          }
          return "";
        },
        controller: textEditingController,
        minLines: 1,
        keyboardType: textInputType,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
            counterText: "",
            hintText: hint,
            label: Text(
              label!,
              style: TextStyle(color: kmMainColor),
            ),
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 2, color: kmMainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kmMainColor))),
      ),
    );
  }
}
