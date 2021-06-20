import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample/modules/login/model/login_object.dart';

class LoginObjectApi {
  static Future<LoginObject> getObjectLogin() async {
    LoginObject loginObject = LoginObject(hasErrors: true);
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))
          .timeout(const Duration(milliseconds: 2000), onTimeout: () {
        throw TimeoutException("getObjectLogin timeout.");
      });

      if (response.statusCode == 200) {
        loginObject = loginObjectFromJson(response.body);
      }
    } catch (err) {
      print('getObjectLogin Error $err');
    }
    return loginObject;
  }
}
