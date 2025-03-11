import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class BeDeviceInfo {
  const BeDeviceInfo._();
  static Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isIOS) {
        // import 'dart:io'
        final iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor; // unique ID on iOS
      }
      if (Platform.isAndroid) {
        final androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.id; // unique ID on Android
      }

      if (Platform.isLinux) {
        final androidDeviceInfo = await deviceInfo.linuxInfo;
        return androidDeviceInfo.id; // unique ID on Android
      }
      if (Platform.isWindows) {
        final androidDeviceInfo = await deviceInfo.windowsInfo;
        return androidDeviceInfo.deviceId; // unique ID on Android
      }
      if (kIsWeb) {
        // Some web specific code there
      }
      // ignore: unused_catch_clause, avoid_catches_without_on_clauses
    } catch (e) {
      final browserInfo = await deviceInfo.webBrowserInfo;
      return browserInfo.userAgent ?? '-1'; // unique ID on Android
    }
    return null;
  }
}
