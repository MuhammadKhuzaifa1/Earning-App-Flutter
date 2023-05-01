import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../constants/Sessions.dart';

class MobileAdsController {

  InterstitialAd? interstitialAd;
 int count = 0;

  Future<void> AppopenAd() async {
    QuerySnapshot Data = await FirebaseFirestore.instance.collection("OpenAd").get();
    var data = Data.docs;
    print(data[0]["Status"]);
    print(data[0]["OpenAdId"]);
    if (data[0]["Status"] == "enable") {
      AppOpenAd.load(
        adUnitId: data[0]["OpenAdId"], request:
      AdRequest(), adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
        },
        onAdFailedToLoad: (error) {
          print("______________${error.toString()}");
        },), orientation: AppOpenAd.orientationPortrait,);
    }
  }
  late final RewardedAd rewardedAd;

  BannerAd getBannnerAd(String id) {
    BannerAd bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: id,
        listener: BannerAdListener(
          onAdClosed: (ad) {
            print(ad);
          },
          onAdLoaded: (ad) {
            print(ad);
          },
          onAdOpened: (ad) {
            print(ad);
          },
        ),
        request: AdRequest());
    return bannerAd;
  }

  Future<void> loadInterstitialAd() async {
    QuerySnapshot addata = await FirebaseFirestore.instance.collection(
        "InterstitialAd").get();
    var data = addata.docs;
    print("34567876543478987654567876567876");
    print(data[0]["Status"]);
    print(data[0]["InterstitialAdId"]);
    if (data[0]["Status"] == "enable") {
      InterstitialAd.load(
        adUnitId: data[0]["InterstitialAdId"],
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            SessionControler().interstitialAd = ad;
            print(
                "asdfkjasdjkfhjkasdhjkfhasjkhfjkashdjkfhsdhfjkasdhfjkhasjkfhjk h $ad");
          },
          onAdFailedToLoad: (error) {
            print("______________${error.toString()}");
          },
        ),
      );
    }
  }

  Future showInterstitialAd() async {
    SessionControler().interstitialAd!.show();
    SessionControler().interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) {
            print('%ad onAdShowedFullScreenContent.');
            loadInterstitialAd();
          },
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            print('$ad onAdDismissedFullScreenContent.');
            ad.dispose();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad,
              AdError error) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
            ad.dispose();
          },
          onAdImpression: (InterstitialAd ad) =>
              print('$ad impression occurred.'),
        );
  }

  // Future<void> rewardedLoad()async{
  //   RewardedAd.load(adUnitId: "ca-app-pub-3940256099942544/5224354917",
  //       request: AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback
  //         (onAdLoaded: (ad){
  //           rewardedAd = ad;
  //       },
  //           onAdFailedToLoad: (ad){
  //           print(ad);
  //           }) );
  // }
  //
  // Future<void> showRewardedAda()async{
  //   if(rewardedAd != null){
  //     rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //
  //       onAdDismissedFullScreenContent: (ad){
  //         ad.dispose();
  //         rewardedLoad();
  //       },
  //       onAdFailedToShowFullScreenContent: (ad, error){
  //         ad.dispose();
  //         rewardedLoad();
  //
  //       },
  //     );rewardedAd!.show(onUserEarnedReward: (ad, reward){
  //       count++;
  //
  //     });
  //
  //   }
  // }
  //
  // // Future<void> Rewardedads()async{
  // //   RewardedAd.load(adUnitId: "ca-app-pub-3940256099942544/5224354917"
  // //       , request: AdRequest(),
  // //       rewardedAdLoadCallback: RewardedAdLoadCallback(
  // //           onAdLoaded: (RewardedAd ad){
  // //             SessionControler().loadRewardedAds = ad;
  // //
  // //             showrewardedAds();
  // //           } ,
  // //           onAdFailedToLoad: (LoadAdError error){
  // //             print("error$error");
  // //           }));
  // // }
  // //
  // // Future<void> showrewardedAds()async{
  // //   SessionControler().loadRewardedAds!.show(onUserEarnedReward: (ad, reward) {
  // //     print(ad);
  // //   },);
  // //   SessionControler().loadRewardedAds!.fullScreenContentCallback;
  // // }
  // //
  // // // Future<void> _setfullscreencallback()async{
  // // //   if(rewardedAd == null ) return null;
  // // //   rewardedAd.fullScreenContentCallback = FullScreenContentCallback(onAdShowedFullScreenContent: (RewardedAd ad){
  // // //     print(ad);},onAdWillDismissFullScreenContent: (RewardedAd ad){
  // // //     print(ad);
  // // //     ad.dispose();
  // // //   },
  // // //     onAdFailedToShowFullScreenContent: (RewardedAd ad,AdError error){
  // // //       print(ad);
  // // //     },
  // // //     onAdImpression: (RewardedAd ad){
  // // //       print(ad);
  // // //     },
  // // //
  // // //   );
  // // //
  // // // }
  // //
  // // Future<void> showRewardedAds()async{
  // //   rewardedAd.show(onUserEarnedReward: (AdWithoutView ad,RewardItem rewardItem){
  // //     num amount = rewardItem.amount;
  // //
  // //   });
  // // }
}