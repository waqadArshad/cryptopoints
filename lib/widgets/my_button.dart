import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    this.buttonText,
    this.onTap,
    this.textSize = 16,
    this.buttonHeight = 50,
    this.iconSize = 11.77,
    this.buttonColor = yellowColor,
    this.showIcon = false,
  }) : super(key: key);
  String? buttonText;
  VoidCallback? onTap;
  Color buttonColor;
  double textSize, buttonHeight, iconSize;
  bool showIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: buttonHeight,
      elevation: 0,
      highlightElevation: 0,
      highlightColor: yellowColor.withOpacity(0.1),
      splashColor: yellowColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: buttonColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          MyText(
            size: textSize,
            text: '$buttonText',
            color: whiteColor,
            maxLines: 1,
            weight: FontWeight.w500,
            overFlow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
