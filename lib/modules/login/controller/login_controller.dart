import 'package:get/get.dart';
import 'package:sample/modules/login/api/login_api.dart';
import 'package:sample/modules/login/api/login_object_api.dart';
import 'package:sample/modules/login/model/login_model.dart';
import 'package:sample/modules/login/model/login_object.dart';

class LoginController extends GetxController {
  RxList<LoginModel> loginModel = <LoginModel>[].obs;
  RxBool loadingLogin = true.obs;
  RxBool errorLogin = false.obs;

  Rx<LoginObject> loginObject = LoginObject().obs;
  RxBool loadingloginObject = true.obs;
  RxBool errorloginObject = false.obs;

  @override
  void onInit() {
    super.onInit();
    _callGetLogin();
    _callGetObjectLogin();
  }

  // ignore: unused_element
  void _callGetLogin() async {
    if (!loadingLogin.value) loadingLogin(true);
    if (errorLogin.value) errorLogin(false);

    List<LoginModel> result = await LoginApi.getLogin();

    if (result.length > 0) {
      loginModel.assignAll(result);
    } else {
      errorLogin(true);
    }
    loadingLogin(false);
  }

  // ignore: unused_element
  void _callGetObjectLogin() async {
    if (!loadingloginObject.value) loadingloginObject(true);
    if (errorloginObject.value) errorloginObject(false);
    LoginObject result = await LoginObjectApi.getObjectLogin();
    if (result.hasErrors == false) {
      loginObject.value = result;
    } else {
      errorloginObject(true);
    }
    loadingloginObject(false);
  }
}
