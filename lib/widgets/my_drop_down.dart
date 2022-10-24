import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/widgets/height_width.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  MyDropDown({
    Key? key,
    required this.heading,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  List items;
  String value;
  String heading;
  ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: heading,
            size: 12,
            weight: FontWeight.w600,
            paddingBottom: 8,
            paddingLeft: 5,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: MyText(
                text: heading,
                color: greyColor,
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: MyText(
                        text: item,
                        size: 12,
                        weight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                  )
                  .toList(),
              value: value,
              onChanged: onChanged,
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                color: greyColor,
                size: 20,
              ),
              isDense: true,
              isExpanded: true,
              buttonHeight: 50,
              buttonPadding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              buttonDecoration: BoxDecoration(
                boxShadow: const [],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: yellowColor,
                ),
                color: whiteColor,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.symmetric(horizontal: 15),
              dropdownMaxHeight: 200,
              dropdownWidth: width(context, 0.85),
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor,
              ),
              dropdownElevation: 4,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-2, -5),
            ),
          ),
        ],
      ),
    );
  }
}
