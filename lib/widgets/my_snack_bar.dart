import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/material.dart';

mySnackBar({
  String? msg,
  Color? bgColor = blackColor,
  BuildContext? context,
}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      backgroundColor: bgColor,
      content: MyText(
        text: '$msg',
        size: 12,
        weight: FontWeight.w500,
        color: whiteColor,
      ),
    ),
  );
}
