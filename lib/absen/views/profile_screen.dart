import 'package:flutter/material.dart';
import 'package:ppkd_b_5/absen/api/profile.dart';
import 'package:ppkd_b_5/absen/models/profile_model.dart';
import 'package:ppkd_b_5/absen/views/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileData? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final result = await getProfile();

      setState(() {
        user = result?.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),

        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditProfileScreen(name: user?.name ?? ""),
                ),
              );
              getProfile().then((result) {
                setState(() {
                  user = result?.data;
                });
              });
            },
            child: const Text("Edit Profile"),
          ),
        ],
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user?.name ?? "-"),

                  const SizedBox(height: 20),

                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user?.email ?? "-"),
                ],
              ),
            ),
    );
  }
}
