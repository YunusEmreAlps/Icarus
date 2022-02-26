// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:icarus/helpers/unitenums.dart';
import 'package:icarus/models/onboardingcontent.dart';

class Utils {

  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
  
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
        message: 'Welcome to Icarus!',
        img: 'onboard1'
      ),
      OnboardingContent(
        message: 'Let’s Reduce Food Waste.',
        img: 'onboard2'
      ),
      OnboardingContent(
        message: 'Come and Join Us ',
        img: 'onboard3'
      )
    ];
  }

  static String weightUnitToString(WeightUnits unit) {
    switch(unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch(platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default: 
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }
}
