import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;
  final String phoneNumber;
  final dynamic password;

  const ProfileScreen(
      {super.key,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Email: $email'),
            Text('Phone Number: $phoneNumber'),
            Text('Password: $password')
          ],
        ),
      ),
    );
  }
}
