import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});

  // username - atuny0, password - 9uQFF1Lh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              usernameTextField(),
              const SizedBox(height: 10),
              passwordTextField(),
              const SizedBox(height: 8),
              const SizedBox(height: 20),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Obx(() {
        return GestureDetector(
          onTap: () {
            loginController.authenticate();
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: loginController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'LogIn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      }),
    );
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: loginController.userNameController,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Username',
            prefixIcon: const Icon(Icons.person),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: loginController.passwordController,
          obscureText: !loginController.isPasswordVisible.value,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                loginController.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                loginController.togglePasswordVisibility();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/7.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
