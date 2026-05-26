import 'dart:developer';
import 'dart:math';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/cupertino.dart';
import '../CSDialog/CSDialog.dart';
import 'cs_extension_help.dart';

class CSAdAHelper {
  static final CSAdAHelper _instance = CSAdAHelper._internal();

  factory CSAdAHelper() {
    return _instance;
  }

  CSAdAHelper._internal();

  String rewardOne = '';

  String? placeId;

  void Function(bool)? finishIntAd;

  void resetBlock() {
    finishIntAd = null;
  }

  void load() {
    if (rewardOne.length == 0) {
      "cardscratchspinearn Reward no data".log();
      return;
    }

    AppLovinMAX.setRewardedAdListener(
      RewardedAdListener(
        onAdLoadedCallback: (ad) {
          _saveCurrentAds(ad.adUnitId);
        },
        onAdLoadFailedCallback: (adUnitId, error) {
          "cardscratchspinearn Reward Failed error ${error}".log();
          _reLoadad(adUnitId, error.message);
        },
        onAdDisplayedCallback: (ad) async {
          // if (SJLocalProvider.instance.sj_bg_music) {
          //   SJAudioUtils().pauseBGM();
          // }
          "cardscratchspinearn Reward did display ${ad.adUnitId}".log();
        },
        onAdDisplayFailedCallback: (ad, error) {
          "cardscratchspinearn Reward did faild to display ${error.message}"
              .log();
          if (this.finishIntAd != null) {
            this.finishIntAd!(false);
          }
        },
        onAdClickedCallback: (ad) {
          "cardscratchspinearn Reward did click ${ad.adUnitId}".log();
        },
        onAdHiddenCallback: (ad) {
          // if (SJLocalProvider.instance.sj_bg_music) {
          //   SJAudioUtils().pauseBGM();
          // }
          "cardscratchspinearn Reward did hide - ${ad.adUnitId}".log();
          if (this.finishIntAd != null) {
            this.finishIntAd!(true);
          }
          load();
        },
        onAdRevenuePaidCallback: (ad) {
          "cardscratchspinearn Reward did pay ${ad.revenue} - ${ad.adUnitId}"
              .log();
          "cardscratchspinearn Int did pay finally ${ad.revenue} - ${ad.adUnitId}"
              .log();
        },
        onAdReceivedRewardCallback: (MaxAd ad, MaxReward reward) {},
      ),
    );

    if (rewardOne.length != 0) {
      "cardscratchspinearn Reward Start Load Root ${rewardOne}".log();
      AppLovinMAX.loadRewardedAd(rewardOne);
    }
  }

  void _reLoadad(String identifer, String message) {
    load();
  }

  void _saveCurrentAds(String identifer) {}

  Future<void> show(
    BuildContext content,
    void Function(bool) hasCache,
    void Function(bool)? finished,
  ) async {
    if (finished != null) {
      finishIntAd = finished;
    }

    bool isReady = (await AppLovinMAX.isRewardedAdReady(rewardOne))!;

    if (isReady) {
      AppLovinMAX.showRewardedAd(rewardOne);
      "cardscratchspinearn Reward request to show pos_id: success root ${rewardOne}"
          .log();
      hasCache(true);
      return;
    }

    "cardscratchspinearn Reward request to show no cache!}".log();
    CSDialogTool.toast(content, 'Ad Loading Failed, Please Try Again Later~');
    load();
    hasCache(false);
  }
}

extension AdRewardHelperExtension on CSAdAHelper {
  initRewardAdDatasource() {
    load();
  }
}
