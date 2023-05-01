
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SessionControler {
  static final SessionControler _session = SessionControler._internal();

  String? userId;
  String? uid;
  String? Coin;
  String? username;
  InterstitialAd? interstitialAd;
  RewardedAd? loadRewardedAds;

  factory SessionControler() {
    return _session;
  }

  SessionControler._internal() {}
}