import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/provider/theme_provider.dart';
import 'package:cryptopoints/screens/splash_screen.dart';
import 'package:cryptopoints/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: darkGreyColor, systemNavigationBarColor: darkGreyColor));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Consumer<ThemeChanger>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: themeProvider.darkTheme == true ? darkTheme : lightTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
// ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
// theme: ThemeData(
//   primarySwatch: Colors.blue,
//   // brightness:Brightness.light,
//   brightness:Brightness.light,
// ),
// theme: darkTheme,
