import 'package:flutter/material.dart';
import 'package:signup/colors/colors.dart';
import 'package:signup/screens/signUpScreens.dart';

class MyAppTheme extends StatelessWidget {
  const MyAppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyColors.primary,
          secondary: MyColors.secondary,
        ),
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpScreen.id,
      routes: <String, WidgetBuilder>{
        SignUpScreen.id: (BuildContext context) => SignUpScreen(),
      },
    );
  }
}
