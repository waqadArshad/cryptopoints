import 'dart:io';

import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/screens/user/home/Settings.dart';
import 'package:cryptopoints/screens/user/home/home_page.dart';
import 'package:cryptopoints/screens/user/profile/profile.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  int? currentIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> screens = [
    // const MyHomePage(),
    const CandleChart(),
    const Profile(),
    //   ChatHead(),
    //   Container(),
    //   Notifications(),
    //   Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        child: SizedBox(
          height: Platform.isAndroid ? 76 : 110,
          child: BottomNavigationBar(
            elevation: 3,
            type: BottomNavigationBarType.fixed,
            backgroundColor: yellowColor,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              color: greyColor,
            ),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              color: whiteColor,
            ),
            selectedItemColor: whiteColor,
            unselectedItemColor: greyColor,
            currentIndex: widget.currentIndex!,
            onTap: (index) => setState(() {
              widget.currentIndex = index;
            }),
            items: [
              BottomNavigationBarItem(
                icon: (widget.currentIndex ?? 0) == 1
                    ? const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: ImageIcon(
                          AssetImage(
                            Assets.assetsHome,
                          ),
                          size: 27.21,
                        ),
                      )
                    : Container(
                        height: 45,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          // border: Border.all(width: 1.0, color: greyColor.withOpacity(0.5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage(
                                  Assets.assetsHome,
                                ),
                                size: 20,
                              ),
                              MyText(
                                text: "Home",
                                paddingLeft: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: (widget.currentIndex ?? 0) == 0
                    ?  const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: ImageIcon(
                    AssetImage(
                      Assets.assetsSettings,
                    ),
                    size: 26.93,
                  ),
                ): Container(
                  height: 45,
                  width: size.width * 0.35,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(width: 1.0, color: greyColor.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Row(
                      children: [
                        const ImageIcon(
                          AssetImage(
                            Assets.assetsSettings,
                          ),
                          size: 20,
                        ),
                        MyText(
                          text: "Settings",
                          paddingLeft: 10,
                        )
                      ],
                    ),
                  ),
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
