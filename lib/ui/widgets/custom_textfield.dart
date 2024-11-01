import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key, this.hintText, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        color: AppColors.textInputColor,
      ),
      textCapitalization: TextCapitalization.words,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          color: AppColors.hintColor,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD4D4D4)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD4D4D4)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD4D4D4)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
