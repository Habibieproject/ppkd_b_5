import 'package:flutter/material.dart';
import 'package:ppkd_b_5/absen/api/login.dart';
import 'package:ppkd_b_5/absen/views/profile_screen.dart';
import 'package:ppkd_b_5/absen/views/register_screen.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> handleLogin() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result?.message ?? "Login berhasil")),
      );
      context.pushAndRemoveAll(const ProfileScreen());
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            /// Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            /// Button Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : handleLogin,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Login"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Belum punya akun? Register",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
