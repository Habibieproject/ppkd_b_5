import 'package:flutter/material.dart';
import 'package:ppkd_b_5/constant/app_color.dart';
import 'package:ppkd_b_5/day_14/drawer_global.dart';
import 'package:ppkd_b_5/day_16_17/database/preference.dart';
import 'package:ppkd_b_5/day_16_17/database/sqflite.dart';
import 'package:ppkd_b_5/day_16_17/models/user_model.dart';
import 'package:ppkd_b_5/day_16_17/utils/decoration_form.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class LoginScreenDay16 extends StatefulWidget {
  const LoginScreenDay16({super.key});

  @override
  State<LoginScreenDay16> createState() => _LoginScreenDay16State();
}

class _LoginScreenDay16State extends State<LoginScreenDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    final UserModel? login = await DBHelper.loginUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (login != null) {
                      PreferenceHandler().storingIsLogin(true);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Login berhasil")));
                      await Future.delayed(Duration(seconds: 2));
                      context.push(DrawerGlobal());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login gagal, email atau password tidak terdaftar",
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
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
                        "Lanjut with Google",
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
    );
  }
}
