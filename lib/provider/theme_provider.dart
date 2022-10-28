import 'package:flutter/cupertino.dart';

class ThemeChanger extends ChangeNotifier {
  //
  bool? darkTheme = false;

  // changeTheme() {
  //   darkTheme = true;
  // }

  toogleTheme() {
    darkTheme = !darkTheme!;
    notifyListeners();
  }
}
