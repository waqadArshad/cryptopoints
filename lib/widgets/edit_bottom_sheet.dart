import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/widgets/my_button.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/material.dart';


Widget bottomSheetForEdit(
  BuildContext context, {
  String? title,
  Widget? selectedField,
  VoidCallback? onSave,
}) {
  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Container(
      height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: const BoxDecoration(
        color: darkGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Expanded(
                child: MyText(
                  text: 'Edit $title',
                  style: Theme.of(context).textTheme.headline2,
                  // size: 19,
                  // color: whiteColor,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  Assets.assetsRoundedClose,
                  height: 22.44,
                ),
              ),
            ],
          ),
          selectedField!,
          MyButton(
            onTap: onSave,
            buttonText: 'save',
          ),
        ],
      ),
    ),
  );
}
