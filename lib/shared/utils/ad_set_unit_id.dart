import 'package:flutter/foundation.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class AdSetUnitId {
  static String get interstitialAdUnitId {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.interstitialAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/8266957278';
  }

  static String get nativeAdUnitIdHomeScreen {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.nativeAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/4115480340';
  }

  static String get nativeAdUnitIdSearchScreen {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.nativeAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/2999244108';
  }

  static String get nativeAdUnitIdNotificationScreen {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.nativeAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/3802379258';
  }

  static String get nativeAdUnitIdProfileScreen {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.nativeAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/1619069045';
  }

  static String get rewardedAdUnitId {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.rewardedAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/4962206896';
  }

  static String get appOpenAdUnitId {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.appOpenAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/5702581104';
  }

  static String get rewardedInterstitialAdUnitId {
    /// Always test with test ads
    if (kDebugMode)
      return MobileAds.rewardedInterstitialAdTestUnitId;
    else
      return 'ca-app-pub-6058104606130639/3102330317';
  }
}
