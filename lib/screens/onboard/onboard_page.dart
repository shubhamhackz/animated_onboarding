import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_onboarding/components/fading_sliding_widget.dart';
import 'package:animated_onboarding/model/onboard_page_item.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPageItem onboardPageItem;

  OnboardPage({this.onboardPageItem});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.15),
      child: Column(
        children: <Widget>[
          Lottie.asset(
            widget.onboardPageItem.lottieAsset,
            controller: _animationController,
            onLoaded: (composition) {
              _animationController
                ..duration = composition.duration
                ..forward()
                ..addListener(() {
                  if (widget.onboardPageItem.animationDuration != null) {
                    if (_animationController.lastElapsedDuration >
                        widget.onboardPageItem.animationDuration) {
                      _animationController.stop();
                    }
                  }
                });
            },
            width: width * 0.9,
          ),
          SizedBox(height: height * 0.1),
          Flexible(
            child: FadingSlidingWidget(
              animationController: _animationController,
              interval: const Interval(0.2, 0.5),
              child: Text(
                widget.onboardPageItem.text,
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontFamily: 'ProductSans',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
