import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/modules/account/controller/account_controller.dart';

class AccountView extends StatelessWidget {
  AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(AccountController());

    return Scaffold(
      body: Center(child: Text('Account')),
    );
  }
}
