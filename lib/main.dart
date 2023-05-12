import 'package:flutter/material.dart';
import 'package:islami_hamo/home_sceern.dart';
import 'package:islami_hamo/splash_screen.dart';
import 'package:islami_hamo/ui/soura_detailes/soura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SouraDetailsScreen.routeName: (_) => SouraDetailsScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      theme: ThemeData(
          cardTheme: CardTheme(
            elevation: 24,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 48),
          ),
          cardColor: Colors.white,
          scaffoldBackgroundColor: Colors.transparent,
          primaryColor: const Color(0xFFB7935F),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 32,
            ),
            elevation: 0,
            color: Colors.transparent,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
          )),
    );
  }
}
