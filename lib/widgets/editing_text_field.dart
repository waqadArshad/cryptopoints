import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ETextField extends StatelessWidget {
  ETextField({
    Key? key,
    this.isObSecure = false,
    this.labelText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.validator,
    this.isReadOnly = false,
    this.isEditAble = false,
    this.autoValidateMode,
    this.keyboardType,
    this.onEditTap,
    this.labelSize = 19.0,
    this.textSize = 16.0,
    this.style,
  }) : super(key: key);

  String? labelText, initialValue;
  bool? isObSecure, isReadOnly, isEditAble;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  AutovalidateMode? autoValidateMode;
  VoidCallback? onEditTap;
  TextInputType? keyboardType;
  double? labelSize,textSize;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      autovalidateMode: autoValidateMode,
      initialValue: initialValue,
      readOnly: isReadOnly!,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isObSecure!,
      obscuringCharacter: '*',
      cursorColor: whiteColor,
      cursorWidth: 1.0,
      style: style ?? TextStyle(
        fontSize: textSize,
        color: whiteColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        // fillColor: kPrimaryColor,
        // filled: true,
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              paddingLeft: 15,
              paddingRight: 10,
              text: labelText,
              style: Theme.of(context).textTheme.headline2,
              size: labelSize,
              color: greyColor,
            ),
          ],
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: isEditAble! ? 50 : 0,
        ),
        suffixIcon: isEditAble!
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onEditTap,
              child: Image.asset(
                Assets.assetsEditIcon,
                height: 16.03,
              ),
            ),
          ],
        )
            : const SizedBox(),
      ),
    );
  }
}
