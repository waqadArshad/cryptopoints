import 'package:flutter/cupertino.dart';

class ThemeChanger extends ChangeNotifier {
  //
  bool? darkTheme=true;


  // changeTheme() {
  //   darkTheme = true;
  // }

  toogleTheme() {
    darkTheme = !darkTheme!;
    notifyListeners();
  }
}
