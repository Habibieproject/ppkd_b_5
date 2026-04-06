import 'package:flutter/material.dart';
import 'package:ppkd_b_5/absen/api/batch.dart';
import 'package:ppkd_b_5/absen/api/register.dart';
import 'package:ppkd_b_5/absen/api/training,dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String gender = "L";

  List trainings = [];
  List batches = [];

  int? selectedTraining;
  int? selectedBatch;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    trainings = await getTrainings();
    batches = await getBatches();

    setState(() {});
  }

  Future<void> handleRegister() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedBatch == null ||
        selectedTraining == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Semua field harus diisi")));

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        jenisKelamin: gender,
        batchId: selectedBatch!,
        trainingId: selectedTraining!,
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

              /// GENDER
              DropdownButtonFormField(
                initialValue: gender,
                decoration: inputDecoration("Jenis Kelamin"),
                items: const [
                  DropdownMenuItem(value: "L", child: Text("Laki-laki")),
                  DropdownMenuItem(value: "P", child: Text("Perempuan")),
                ],
                onChanged: (v) {
                  gender = v!;
                },
              ),

              const SizedBox(height: 16),

              /// TRAINING
              DropdownButtonFormField<int>(
                initialValue: selectedTraining,
                decoration: inputDecoration("Training"),
                items: trainings.map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem(
                    value: e["id"],
                    child: Text(e["title"]),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    selectedTraining = v;
                  });
                },
              ),

              const SizedBox(height: 16),

              /// BATCH
              DropdownButtonFormField<int>(
                initialValue: selectedBatch,
                decoration: inputDecoration("Batch"),
                items: batches.map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem(
                    value: e["id"],
                    child: Text("Batch ${e["batch_ke"]}"),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    selectedBatch = v;
                  });
                },
              ),

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
