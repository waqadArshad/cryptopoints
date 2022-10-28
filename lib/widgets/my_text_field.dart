import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.maxLines = 1,
    this.obscureText = false,
    this.validator,
    this.enableSuggestions = true,
    this.textInputType = TextInputType.text,
    this.cursorColor,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final bool? enableSuggestions;
  final TextInputType? textInputType;
  final TextInputAction textInputAction;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: textInputType ?? TextInputType.text,
      // cursorColor: cursorColor ?? Colors.white,
      enableSuggestions: enableSuggestions ?? true,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      toolbarOptions: const ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      obscuringCharacter: "*",
      // style: TextStyle(color: whiteColor, fontFamily: GoogleFonts.openSans().fontFamily),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
