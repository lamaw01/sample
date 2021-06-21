import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:new_version/new_version.dart';
import 'package:sizer/sizer.dart';

class SplashScreenController extends GetxController {
  final newVersion = NewVersion(
    androidId: 'com.e2e.bigbys',
    iOSId: 'com.e2e.bigbys',
  );

  RxString storeLink = ''.obs;

  // ignore: unused_element
  void _getAppVersion() async {
    try {
      final VersionStatus? status = await newVersion.getVersionStatus();

      print("localVersion ${status!.localVersion}");
      print("storeVersion ${status.storeVersion}");
      print("canUpdate ${status.canUpdate}");
      print("appStoreLink ${status.appStoreLink}");

      storeLink.value = status.appStoreLink;

      if (!status.canUpdate) {
        _newVersionDialog();
      } else {
        Get.offNamed('/login');
      }
    } catch (err) {
      print('$err');
      Get.offNamed('/login');
    }
  }

  void _launchToStore() {
    LaunchReview.launch(androidAppId: "com.e2e.bigbys", iOSAppId: "1517630422");
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
       Get.offNamed('/login');
    });
   
    // _getAppVersion();
  }

  _newVersionDialog() {
    return Get.dialog(
      GetPlatform.isAndroid
          ? AlertDialog(
              title: Text(
                'Update Available',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Update app to get the best version!',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    "Let's go!",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  onPressed: _launchToStore,
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: Text(
                'Update Available',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Update app to get the best version!',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    "Let's go!",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  onPressed: _launchToStore,
                ),
              ],
            ),
    );
  }
}
