import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_39/service/firebase_service.dart';

class RegisterFirebaseScreen extends StatefulWidget {
  const RegisterFirebaseScreen({super.key});

  @override
  State<RegisterFirebaseScreen> createState() => _RegisterFirebaseScreenState();
}

class _RegisterFirebaseScreenState extends State<RegisterFirebaseScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> handleRegister() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Semua field harus diisi")));

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseService.registerUser(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Register berhasil")));

      /// kembali ke login
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"), centerTitle: true),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 10),

              /// NAME
              TextField(
                controller: nameController,
                decoration: inputDecoration("Nama"),
              ),

              const SizedBox(height: 16),

              /// EMAIL
              TextField(
                controller: emailController,
                decoration: inputDecoration("Email"),
              ),

              const SizedBox(height: 16),

              /// PASSWORD
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: inputDecoration("Password"),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 30),

              /// BUTTON REGISTER
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : handleRegister,

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Register", style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
