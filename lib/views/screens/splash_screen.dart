import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:priority_assist/controllers/splash/splash_controller.dart';
import 'package:priority_assist/utils/routes/app_names.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashProvider);

    ref.listen<SplashNavigationState>(navigationStateProvider, (
      previous,
      next,
    ) {
      if (next == SplashNavigationState.navigateToHome) {
        context.go(AppNames.homeScreen.route);
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: Center(
                child: AnimatedContainer(
                  width: splashState.logoSize.w,
                  height: splashState.logoSize.w,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/images/Google_Gemini.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            CircularProgressIndicator(color: Theme.of(context).focusColor),
          ],
        ),
      ),
    );
  }
}
