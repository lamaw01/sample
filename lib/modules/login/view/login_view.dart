import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/modules/login/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              for (var item in controller.loginModel) {
                print(item.name);
              }
            },
          ),
        ],
      ),
    );
  }
}
