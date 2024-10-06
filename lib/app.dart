import 'package:estore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:estore/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: TAppTheme.lightTheme,

      darkTheme: TAppTheme.darkTheme,

      home: OnBoardingScreen(),
    );
  }
}
