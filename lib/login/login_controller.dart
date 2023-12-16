import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/task/task_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible(!isPasswordVisible.value);
  }

  Future<void> authenticate() async {
    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': userNameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Authentication Successful',
          'Status code: ${response.statusCode}',
          backgroundColor: Colors.green,
        );
        Get.to(const ToDoList());
      } else {
        Get.snackbar(
          'Authentication failed!',
          'Status code: ${response.statusCode}\nResponse body: ${response.body}',
          backgroundColor: Colors.red,
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
