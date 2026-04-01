import 'package:flutter/material.dart';
import 'package:ppkd_b_5/constant/app_color.dart';
import 'package:ppkd_b_5/day_14/drawer_global.dart';
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_30/views/login_screen.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class SplashScreenDay16 extends StatefulWidget {
  const SplashScreenDay16({super.key});

  @override
  State<SplashScreenDay16> createState() => _SplashScreenDay16State();
}

class _SplashScreenDay16State extends State<SplashScreenDay16> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai, Joshua");
    if (data == true) {
      context.pushAndRemoveAll(DrawerGlobal());
    } else {
      context.pushAndRemoveAll(LoginScreenDay30());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.redSetetesColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/images/logo_setetes.png")],
      ),
    );
  }
}
