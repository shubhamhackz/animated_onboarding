import 'package:flutter/material.dart';

class FadingSlidingWidget extends StatelessWidget {
  const FadingSlidingWidget({
    @required AnimationController animationController,
    @required this.child,
    this.interval = const Interval(
      0.5,
      1.0,
    ),
  }) : _animationController = animationController;

  final AnimationController _animationController;
  final Widget child;
  final Interval interval;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animationController.drive(
        Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero).chain(
          CurveTween(
            curve: interval,
          ),
        ),
      ),
      child: FadeTransition(
        opacity: _animationController.drive(
          Tween<double>(begin: 0.0, end: 1.0).chain(
            CurveTween(
              curve: interval,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
