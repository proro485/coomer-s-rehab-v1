import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId => Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-3940256099942544/6300978111';

  static initialize () {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }
  static BannerAd createBannerAd () {
    BannerAd ad = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => print('Ad Loaded'),
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
          },
          onAdOpened: (Ad ad) => print('Ad opened'),
          onAdClosed: (Ad ad) => print('Ad closed'),
        ),
        request: AdRequest(),
    );

    return ad;
  }
}