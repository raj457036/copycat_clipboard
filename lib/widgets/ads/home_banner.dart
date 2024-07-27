import 'package:clipboard/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:universal_io/io.dart';

class HomeBannerAd extends StatefulWidget {
  const HomeBannerAd({super.key});

  @override
  State<HomeBannerAd> createState() => _HomeBannerAdState();
}

class _HomeBannerAdState extends State<HomeBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  String? get adUnitId {
    if (Platform.isAndroid) {
      // if (kDebugMode)
      return androidTestAdUnit;
      // return "ca-app-pub-2217728188815563/7003381606";
    }
    if (Platform.isIOS) {
      // if (kDebugMode)
      return iosTestAdUnit;
      // return "ca-app-pub-2217728188815563/1754924358";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    loadAd();
  }

  /// Loads a banner ad.
  void loadAd() {
    if (adUnitId == null) return;
    _bannerAd = BannerAd(
      adUnitId: adUnitId!,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null && _isLoaded) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
