import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1714833414249864/7164897971";
    } else {
      throw UnsupportedError("Unsupported Platform");
    }
  }

  static String get bannerAdUnitIt {
    if (Platform.isAndroid) {
      return "ca-app-pub-1714833414249864/4302521799";
    } else {
      throw UnsupportedError("Unsupported Platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1714833414249864/4028309184";
    } else {
      throw UnsupportedError("Unsupported Platform");
    }
  }
}
