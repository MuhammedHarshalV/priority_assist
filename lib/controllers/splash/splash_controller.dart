import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priority_assist/controllers/splash/splash_state.dart';

// State class for splash animation

// Navigation states
enum SplashNavigationState { loading, navigateToHome, navigateToLogin }

// StateNotifier for splash logic
class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.wait([_startAnimation(), _checkUserStatus()]);
  }

  // Animation logic
  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));

    for (int i = 100; i <= 300; i++) {
      if (!mounted) return;
      await Future.delayed(const Duration(milliseconds: 10));

      state = state.copyWith(
        logoSize: i.toDouble(),
        borderRadius: 20 + ((i - 100) / 200 * 80),
      );
    }
  }

  // Check user authentication status
  Future<void> _checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    state = state.copyWith(
      navigationState: SplashNavigationState.navigateToHome,
    );
  }

  // Manual navigation trigger (if needed)
  void resetNavigation() {
    state = state.copyWith(navigationState: SplashNavigationState.loading);
  }
}

// Provider
final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>((
  ref,
) {
  return SplashNotifier();
});

// Individual providers for specific values (optional)
final logoSizeProvider = Provider<double>((ref) {
  return ref.watch(splashProvider).logoSize;
});

final borderRadiusProvider = Provider<double>((ref) {
  return ref.watch(splashProvider).borderRadius;
});

final navigationStateProvider = Provider<SplashNavigationState>((ref) {
  return ref.watch(splashProvider).navigationState;
});
