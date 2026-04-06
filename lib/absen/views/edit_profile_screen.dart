import 'package:flutter/material.dart';
import 'package:ppkd_b_5/absen/api/update_profile.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;

  const EditProfileScreen({super.key, required this.name});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  Future<void> handleUpdate() async {
    setState(() {
      isLoading = true;
    });

    try {
      await updateProfile(name: nameController.text);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile berhasil diperbarui")),
      );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : handleUpdate,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
