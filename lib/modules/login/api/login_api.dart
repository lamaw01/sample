import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sample/modules/login/model/login_model.dart';

class LoginApi {
  static var client = http.Client();

  static Future<List<LoginModel>> getLogin() async {
    List<LoginModel> loginModel = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("getLogin timeout.");
      });

      if (response.statusCode == 200) {
        loginModel = loginModelFromJson(response.body);
        return loginModel;
      }
    } catch (err) {
      print('getLogin Error $err');
    }

    return loginModel;
  }
}
