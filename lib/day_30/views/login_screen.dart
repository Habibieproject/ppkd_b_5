import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkd_b_5/constant/app_color.dart';
import 'package:ppkd_b_5/day_14/drawer_global.dart';
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_16_17_18/database/sqflite.dart';
import 'package:ppkd_b_5/day_16_17_18/models/user_model.dart';
import 'package:ppkd_b_5/day_16_17_18/utils/decoration_form.dart';
import 'package:ppkd_b_5/day_30/api/register.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class LoginScreenDay30 extends StatefulWidget {
  const LoginScreenDay30({super.key});

  @override
  State<LoginScreenDay30> createState() => _LoginScreenDay30State();
}

class _LoginScreenDay30State extends State<LoginScreenDay30> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FadeInUp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  "Masuk ke Akun Anda",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackText,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Lanjutkan aksi kebaikanmu hari ini",
                  style: TextStyle(fontSize: 12, color: AppColor.greyText),
                ),
                SizedBox(height: 20),

                Text(
                  "Nama",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  decoration: decorationConstant(hintText: "Bagus Tri"),
                ),
                SizedBox(height: 16),
                Text(
                  "Email atau Nomor Telepon",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: decorationConstant(hintText: "nama@email.com"),
                ),
                SizedBox(height: 16),
                Text(
                  "Kata Sandi",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 8),

                TextFormField(
                  controller: passwordController,
                  decoration: decorationConstant(hintText: "••••••••"),
                ),
                SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: AppColor.redSetetesColor,
                    ),
                    onPressed: () async {
                      setState(() {});
                      isLoading = true;
                      String? message;
                      String? token;
                      try {
                        final login = await registerUser(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        message = login?.message;
                        PreferenceHandler().storingToken(
                          login?.data?.token ?? "",
                        );
                        token = login?.data?.token ?? "";
                        log(login?.message ?? "");
                      } catch (e) {
                        log(e.toString());

                        // Clean up common exception prefixes for a nicer message
                        message = e
                            .toString()
                            .replaceFirst('Exception: ', '')
                            .replaceFirst('HttpException: ', '')
                            .trim();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message.toString())),
                      );
                      setState(() {});
                      isLoading = false;
                      if (token != null) {
                        context.push(DrawerGlobal());
                      }
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.login, size: 16, color: Colors.white),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 12),

                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: AppColor.redSetetesColor,
                    ),
                    onPressed: () {
                      DBHelper.registerUser(
                        UserModel(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pendaftaran Berhasil")),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Daftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.login, size: 16, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      var dataIsLogin = PreferenceHandler.getIsLogin();
                      print(dataIsLogin);
                      DBHelper.loginUser(
                        email: "habibie@gmail.com",
                        password: "123",
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png", height: 24),
                        SizedBox(width: 8),
                        Text(
                          "Lanjut dengan Google",
                          style: TextStyle(
                            color: AppColor.greyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Belum punya akun? ",
                            style: TextStyle(
                              color: AppColor.greyText2,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: "Daftar",
                            style: TextStyle(
                              color: AppColor.redSetetesColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Lottie.asset("assets/animations/empty.json", height: 50),
                // FutureBuilder(
                //   future: DBHelper. ,
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //     return ;
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
