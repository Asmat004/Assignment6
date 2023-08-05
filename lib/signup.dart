import 'package:flutter/material.dart';
import 'dart:core';

import 'profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == "") {
                    return "Name field cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _username = value!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == '') {
                    return 'Email can not be empty';
                  } else if (!value!.contains('@') || !value.contains('.com')) {
                    return 'Please enter a valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _email = value!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == '') {
                    return 'Please Enter Your Password';
                  } else if (value!.length <= 8) {
                    return 'Password should be graater than 8 digits';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: _phoneKey,
                controller: phoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Phone Number';
                  } else if (!RegExp(r'^923\d{9}$').hasMatch(value)) {
                    return 'Please Enter A Valid Number';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              ElevatedButton(
                  onPressed: _submitForm, child: const Text('Sign Up Page'))
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(
                    email: _email,
                    password: _password,
                    phoneNumber: _phoneNumber,
                    username: _username,
                  )));
    }
  }
}
