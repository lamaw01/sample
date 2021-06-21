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

  RxDouble total = 0.00.obs;

  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();
    _callGetLogin();
    _callGetObjectLogin();
  }

  void _callGetLogin() async {
    try {
      List<LoginModel> result = await LoginApi.getLogin();

      loginModel.assignAll(result);
    } catch (error) {
      if (error == true) errorLogin(true);
    } finally {
      loadingLogin(false);
    }
  }

  void _callGetObjectLogin() async {
    try {
      LoginObject result = await LoginObjectApi.getObjectLogin();

      loginObject.value = result;
    } catch (error) {
      if (error == true) errorloginObject(true);
    } finally {
      loadingloginObject(false);
    }
  }
}
