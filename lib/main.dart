import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priority_assist/themes/app_themes.dart';
import 'package:priority_assist/utils/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Priority_Assist',
          themeMode: ThemeMode.system,
          theme: Apptheme.lighttheme.copyWith(
            scaffoldBackgroundColor:
                Apptheme.lighttheme.scaffoldBackgroundColor,
            appBarTheme: Apptheme.lighttheme.appBarTheme.copyWith(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor:
                    Apptheme.lighttheme.scaffoldBackgroundColor,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: Colors.transparent,
              ),
            ),
          ),
          darkTheme: Apptheme.darkTheme.copyWith(
            scaffoldBackgroundColor: Apptheme.darkTheme.scaffoldBackgroundColor,
            appBarTheme: Apptheme.darkTheme.appBarTheme.copyWith(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor:
                    Apptheme.darkTheme.scaffoldBackgroundColor,
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarDividerColor: Colors.transparent,
              ),
            ),
          ),
          routerConfig: router, // Use GoRouter configuration
        );
      },
    );
  }
}
