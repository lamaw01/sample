import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/global/shared/globalloding.dart';
import 'package:sample/global/widgets/error_view.dart';
import 'package:sample/modules/login/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    Widget _listLogin() {
      return Obx(() {
        if (controller.loadingLogin.value) {
          return GlobalLoading();
        } else if (controller.errorLogin.value) {
          return ErrorView(message: 'Error getting List');
        } else {
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(),
            itemCount: controller.loginModel.length,
            itemBuilder: (_, int i) {
              return ListTile(
                title: Text(controller.loginModel[i].name.toString()),
              );
            },
          );
        }
      });
    }

    Widget _listObjectLogin() {
      return Obx(() {
        if (controller.loadingloginObject.value) {
          return GlobalLoading();
        } else if (controller.errorloginObject.value) {
          return ErrorView(message: 'Error getting Object');
        } else {
          return ListTile(
            leading: Text(controller.loginObject.value.id.toString()),
            title: Text(controller.loginObject.value.email.toString()),
            subtitle: Text(controller.loginObject.value.name.toString()),
          );
        }
      });
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: _listLogin(),
          ),
          Flexible(
            flex: 1,
            child: _listObjectLogin(),
          ),
        ],
      ),
    );
  }
}
