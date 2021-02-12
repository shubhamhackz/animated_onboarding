import 'package:flutter/foundation.dart';

class OnboardPageItem {
  String lottieAsset;
  Duration animationDuration;
  String text;

  OnboardPageItem(
      {@required this.lottieAsset,
      @required this.text,
      this.animationDuration});
}
