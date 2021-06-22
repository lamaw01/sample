import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample/core/services/model/andriod_model.dart';

class StorageService extends GetxService {
  static StorageService instance = Get.find();

  final box = GetStorage('appstorage');

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Map<String, dynamic> deviceInfo = <String, dynamic>{};

  Rx<AndriodDeviceData> androidData = AndriodDeviceData().obs;

  @override
  void onInit() {
    super.onInit();
    _initPlatformState();
  }

  Future<void> _initPlatformState() async {
    Map<String, dynamic> _deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        androidData.value =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        print("_deviceData ${json.encode(_deviceData)}");
      }
    } on PlatformException {
      _deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    } catch (err) {
      print('$err');
    }

    deviceInfo = _deviceData;
  }

  AndriodDeviceData _readAndroidBuildData(AndroidDeviceInfo build) {
    return AndriodDeviceData(
      versionSecurityPatch: build.version.securityPatch!,
      versionSdkInt: build.version.sdkInt,
      versionRelease: build.version.release,
      versionPreviewSdkInt: build.version.previewSdkInt!.toInt(),
      versionIncremental: build.version.incremental,
      versionCodename: build.version.codename,
      versionBaseOs: build.version.baseOS!,
      board: build.board,
      bootloader: build.bootloader,
      brand: build.brand,
      device: build.device,
      display: build.display,
      fingerprint: build.fingerprint,
      hardware: build.hardware,
      host: build.host,
      id: build.id,
      manufacturer: build.manufacturer,
      model: build.model,
      product: build.product,
      tags: build.tags,
      type: build.type,
      isPhysicalDevice: build.isPhysicalDevice,
      androidId: build.androidId,
    );
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
