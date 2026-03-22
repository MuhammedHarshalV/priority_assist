import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_assist/utils/routes/app_names.dart';
import 'package:priority_assist/views/screens/add_job_screen.dart';
import 'package:priority_assist/views/screens/home_screen.dart';
import 'package:priority_assist/views/screens/job_accept_screen.dart';
import 'package:priority_assist/views/screens/splash_screen.dart';

// Route path constants

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    // Splash Screen
    GoRoute(
      path: AppNames.splashScreen.route,
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    // Authentication Routes
    GoRoute(
      path: AppNames.homeScreen.route,
      name: 'homeScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: AppNames.addJobsScreen.route,
      name: 'addJobsScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const AddJobScreen();
      },
    ),
    GoRoute(
      path: AppNames.acceptScreen.route,
      name: 'emailLogin',
      builder: (BuildContext context, GoRouterState state) {
        return const JobAcceptScreen();
      },
    ),
    // GoRoute(
    //   path: AppNames.emailOtpScreen.route,
    //   name: 'emailOtp',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const EmailOtpScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AppNames.phoneOtpScreen.route,
    //   name: 'phoneOtp',
    //   builder: (BuildContext context, GoRouterState state) {
    //     // Get phone number from extra or query parameters
    //     final phoneNumber =
    //         state.extra as int? ??
    //         int.tryParse(state.uri.queryParameters['phone'] ?? '0') ??
    //         0;
    //     return PhoneOtpScreen(phonenumber: phoneNumber);
    //   },
    // ),

    // // Main Navigation
    // GoRoute(
    //   path: AppNames.navScreen.route,
    //   name: 'nav',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return BottomNavScreen();
    //   },
    // ),

    // // Home Routes
    // GoRoute(
    //   path: AppNames.homeScreen.route,
    //   name: 'home',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const HomeScreen();
    //   },
    // ),

    // //   // Profile Routes
    // GoRoute(
    //   path: AppNames.profileScreen.route,
    //   name: 'profile',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CommonProfileScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AppNames.editProfileScreen.route,
    //   name: 'editProfile',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const EditProfileScreen();
    //   },
    // ),

    // //   // Events Routes
    // //   GoRoute(
    // //     path: AppNames.yourEventsScreen.route,
    // //     name: 'yourEvents',
    // //     builder: (BuildContext context, GoRouterState state) {
    // //       return const YourEventsScreen();
    // //     },
    // //   ),
    // //   GoRoute(
    // //     path: AppNames.eventsDetailsScreen.route,
    // //     name: 'eventsDetails',
    // //     builder: (BuildContext context, GoRouterState state) {
    // //       return const EventsDetailsScreen();
    // //     },
    // //   ),
    // GoRoute(
    //   path: AppNames.createEventScreen.route,
    //   name: 'createEvent',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CreateEventScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AppNames.calenderDetailsScreen.route,
    //   name: 'calendarDetails',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CalendarDetailsScreen();
    //   },
    // ),

    // // Discovery Routes
    // GoRoute(
    //   path: AppNames.discoverScreen.route,
    //   name: 'discover',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const DiscoverScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AppNames.discoverDetailsScreen.route,
    //   name: 'discoverDetails',
    //   builder: (BuildContext context, GoRouterState state) {
    //     // Get title from extra or query parameters
    //     final title =
    //         state.extra as String? ??
    //         state.uri.queryParameters['title'] ??
    //         'Default Title';
    //     return DiscoveryCategoryDetailedScreen(titleText: title);
    //   },
    // ),

    // //   // Settings Routes
    // GoRoute(
    //   path: AppNames.settingsScreen.route,
    //   name: 'settings',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const SettingsScreen();
    //   },
    // ),
    // GoRoute(
    //   path: AppNames.accountSettingsScreen.route,
    //   name: 'accountSettings',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const AccountSettingsScreen();
    //   },
    // ),
    // //   GoRoute(
    // //     path: AppNames.updateUsernameScreen.route,
    // //     name: 'updateUsername',
    // //     builder: (BuildContext context, GoRouterState state) {
    // //       return const UpdateUsernameScreen();
    // //     },
    // //   ),
    // //   GoRoute(
    // //     path: AppNames.editEmailScreen.route,
    // //     name: 'editEmail',
    // //     builder: (BuildContext context, GoRouterState state) {
    // //       return const EditEmailScreen();
    // //     },
    // //   ),
    // //   GoRoute(
    // //     path: AppNames.editPhoneScreen.route,
    // //     name: 'editPhone',
    // //     builder: (BuildContext context, GoRouterState state) {
    // //       return const EditPhoneScreen();
    // //     },
    // //   ),

    // //   // Other Routes
    // GoRoute(
    //   path: AppNames.paymentScreen.route,
    //   name: 'payment',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const PaymentScreen();
    //   },
    // ),
    //   GoRoute(
    //     path: AppNames.contactsupportScreen.route,
    //     name: 'contactSupport',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const ContactSupportScreen();
    //     },
    //   ),
  ],

  // Error page
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            Text('Page not found: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppNames.splashScreen.route),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  },
);
