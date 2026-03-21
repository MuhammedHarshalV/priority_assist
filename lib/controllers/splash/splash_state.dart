

import 'package:priority_assist/controllers/splash/splash_controller.dart';

class SplashState {
  final double logoSize;
  final double borderRadius;
  final SplashNavigationState navigationState;

  const SplashState({
    this.logoSize = 100.0,
    this.borderRadius = 20.0,
    this.navigationState = SplashNavigationState.loading,
  });

  SplashState copyWith({
    double? logoSize,
    double? borderRadius,
    SplashNavigationState? navigationState,
  }) {
    return SplashState(
      logoSize: logoSize ?? this.logoSize,
      borderRadius: borderRadius ?? this.borderRadius,
      navigationState: navigationState ?? this.navigationState,
    );
  }
}