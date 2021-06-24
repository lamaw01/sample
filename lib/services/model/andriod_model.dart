// To parse this JSON data, do
//
//     final andriodDeviceData = andriodDeviceDataFromJson(jsonString);

import 'dart:convert';

AndriodDeviceData andriodDeviceDataFromJson(String str) =>
    AndriodDeviceData.fromJson(json.decode(str));

String andriodDeviceDataToJson(AndriodDeviceData data) =>
    json.encode(data.toJson());

class AndriodDeviceData {
  AndriodDeviceData({
     this.versionSecurityPatch,
     this.versionSdkInt,
     this.versionRelease,
     this.versionPreviewSdkInt,
     this.versionIncremental,
     this.versionCodename,
     this.versionBaseOs,
     this.board,
     this.bootloader,
     this.brand,
     this.device,
     this.display,
     this.fingerprint,
     this.hardware,
     this.host,
     this.id,
     this.manufacturer,
     this.model,
     this.product,
     this.tags,
     this.type,
     this.isPhysicalDevice,
     this.androidId,
  });

  final String? versionSecurityPatch;
  final int? versionSdkInt;
  final String? versionRelease;
  final int? versionPreviewSdkInt;
  final String? versionIncremental;
  final String? versionCodename;
  final String? versionBaseOs;
  final String? board;
  final String? bootloader;
  final String? brand;
  final String? device;
  final String? display;
  final String? fingerprint;
  final String? hardware;
  final String? host;
  final String? id;
  final String? manufacturer;
  final String? model;
  final String? product;
  final String? tags;
  final String? type;
  final bool? isPhysicalDevice;
  final String? androidId;

  factory AndriodDeviceData.fromJson(Map<String, dynamic> json) =>
      AndriodDeviceData(
        versionSecurityPatch: (json["version.securityPatch"]),
        versionSdkInt: json["version.sdkInt"],
        versionRelease: json["version.release"],
        versionPreviewSdkInt: json["version.previewSdkInt"],
        versionIncremental: json["version.incremental"],
        versionCodename: json["version.codename"],
        versionBaseOs: json["version.baseOS"],
        board: json["board"],
        bootloader: json["bootloader"],
        brand: json["brand"],
        device: json["device"],
        display: json["display"],
        fingerprint: json["fingerprint"],
        hardware: json["hardware"],
        host: json["host"],
        id: json["id"],
        manufacturer: json["manufacturer"],
        model: json["model"],
        product: json["product"],
        tags: json["tags"],
        type: json["type"],
        isPhysicalDevice: json["isPhysicalDevice"],
        androidId: json["androidId"],
      );

  Map<String, dynamic> toJson() => {
        "version.securityPatch": versionSecurityPatch.toString(),
        "version.sdkInt": versionSdkInt,
        "version.release": versionRelease,
        "version.previewSdkInt": versionPreviewSdkInt,
        "version.incremental": versionIncremental,
        "version.codename": versionCodename,
        "version.baseOS": versionBaseOs,
        "board": board,
        "bootloader": bootloader,
        "brand": brand,
        "device": device,
        "display": display,
        "fingerprint": fingerprint,
        "hardware": hardware,
        "host": host,
        "id": id,
        "manufacturer": manufacturer,
        "model": model,
        "product": product,
        "tags": tags,
        "type": type,
        "isPhysicalDevice": isPhysicalDevice,
        "androidId": androidId,
      };
}
