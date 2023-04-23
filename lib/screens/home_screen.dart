import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:visit_oromia/Natural_parks/Awash_screen.dart';
import 'package:visit_oromia/data/ad_helper.dart';

import 'package:visit_oromia/museams/jifar_screen.dart';

import '../Forests/yoya_screen.dart';
import '../cave/sofomar_screen.dart';
import '../mountains/chuk_screen.dart';
import '../religion/shek_screen.dart';
import '../waters/basaka_screen.dart';
import '../widgets/home_app_bar.dart';

const int maxFailedLoadAttempts = 3;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var category = [
    "Best Places",
    "Most Visited",
    "Favourites",
    "New Added",
    "Hotels",
    "Restaurants",
  ];

  List<String> cities = [
    "National parks",
    "Museums and Palaces",
    "Cave and Rock Arts",
    "Water Bodies",
    "Mountains",
    "Religious Pilgrimage",
    "Forests",
  ];

  List<String> vertical = [
    "Karayu",
    "Female Nyala, Dinsho National Park",
  ];

  final _list = [
    ItemModel(title: "Performance Pulses", route: const AwashScreen()),
    ItemModel(title: "Admin Indicator", route: const JifarScreen()),
    ItemModel(title: "Admin Indicator", route: const SofomarScreen()),
    ItemModel(title: "Admin Indicator", route: const BasakaScreen()),
    ItemModel(title: "Admin Indicator", route: const ChukScreen()),
    ItemModel(title: "Admin Indicator", route: const ShekScreen()),
    ItemModel(title: "Admin Indicator", route: const YoyaScreen()),
  ];
  final _inlineAdIndex = 3;

  int _interstitialLoadAttempts = 0;

  late BannerAd _bottomBannerAd;
  late BannerAd _inlineBannerAd;
  InterstitialAd? _interstitialAd;

  bool _isBottomBannerAdLoaded = false;
  bool _isInlineBannerAdLoaded = false;

  int _getListViewItemIndex(int index) {
    if (index >= _inlineAdIndex && _isInlineBannerAdLoaded) {
      return index - 1;
    }
    return index;
  }

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              _isBottomBannerAdLoaded = true;
            },
          );
        },
        onAdFailedToLoad: ((ad, error) {
          ad.dispose();
        }),
      ),
    );
    _bottomBannerAd.load();
  }

  void _createInlineBannerAd() {
    _inlineBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIt,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              _isInlineBannerAdLoaded = true;
            },
          );
        },
        onAdFailedToLoad: ((ad, error) {
          ad.dispose();
        }),
      ),
    );
    _inlineBannerAd.load();
  }

  void _createInterstialAd() {
    _interstitialLoadAttempts += 1;
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
        _interstitialLoadAttempts = 0;
      }, onAdFailedToLoad: (LoadAdError error) {
        _interstitialAd = null;

        if (_interstitialLoadAttempts >= maxFailedLoadAttempts) {
          _createInterstialAd();
        }
      }),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        _createInterstialAd();
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        _createInterstialAd();
      });
      _interstitialAd!.show();
    }
  }

  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
    _createInlineBannerAd();
    _createInterstialAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
    _inlineBannerAd.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _isBottomBannerAdLoaded
          ? SizedBox(
              height: _bottomBannerAd.size.height.toDouble(),
              width: _bottomBannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bottomBannerAd),
            )
          : null,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Column(
            children: [
              Column(
                children: const [
                  Text(
                    "Popular destinations",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 6 + (_isInlineBannerAdLoaded ? 1 : 0),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (_isInlineBannerAdLoaded &&
                              index == _inlineAdIndex) {
                            return Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              width: _inlineBannerAd.size.width.toDouble(),
                              height: _inlineBannerAd.size.height.toDouble(),
                              child: AdWidget(ad: _inlineBannerAd),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                _showInterstitialAd();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        _list[_getListViewItemIndex(index)]
                                            .route,
                                  ),
                                );
                              },
                              child: Container(
                                width: 160,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("img/city${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          cities[index],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      for (int i = 0; i < 6; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            category[i],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("img/one${index + 1}.png"),
                                    fit: BoxFit.cover,
                                    opacity: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    vertical[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  final String title;
  final Widget route;

  ItemModel({required this.title, required this.route});
}
