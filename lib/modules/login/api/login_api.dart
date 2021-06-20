import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample/modules/login/model/login_model.dart';

class LoginApi {
  static Future<List<LoginModel>> getLogin() async {
    List<LoginModel> loginModel = [];
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(const Duration(milliseconds: 2000), onTimeout: () {
        throw TimeoutException("getLogin timeout.");
      });

      if (response.statusCode == 200) {
        loginModel = loginModelFromJson(response.body);
<<<<<<< HEAD
=======
        // return loginModel;
>>>>>>> 1974819807c978a03fe482eb098ebc23f020d16e
      }
    } catch (err) {
      print('getLogin Error $err');
      rethrow;
    }
    return loginModel;
  }
}
