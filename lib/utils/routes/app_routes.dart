import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_assist/models/job_request_model.dart';
import 'package:priority_assist/utils/routes/app_names.dart';
import 'package:priority_assist/views/screens/add_job_screen.dart';
import 'package:priority_assist/views/screens/go_to_que_screen.dart';
import 'package:priority_assist/views/screens/home_screen.dart';
import 'package:priority_assist/views/screens/job_accept_screen.dart';
import 'package:priority_assist/views/screens/jobs_history_screen.dart';
import 'package:priority_assist/views/screens/queue_list_screen.dart';
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
      name: 'acceptScreen',
      builder: (BuildContext context, GoRouterState state) {
        final job = state.extra as JobRequestModel;
        return JobAcceptScreen(jobRequestModel: job);
      },
    ),
    GoRoute(
      path: AppNames.jobsHistoryScreen.route,
      name: 'JobsHistoryScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const JobsHistoryScreen();
      },
    ),
    GoRoute(
      path: AppNames.queuescreenAccept.route,
      name: 'Queacceptscreen',
      builder: (BuildContext context, GoRouterState state) {
        final job = state.extra as JobRequestModel;
        return GotoQueScreen(jobRequestModel: job);
      },
    ),
    GoRoute(
      path: AppNames.queListScreen.route,
      name: 'queListscreen',
      builder: (BuildContext context, GoRouterState state) {
        return const QueueListScreen();
      },
    ),
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
              onPressed: () => context.go(AppNames.homeScreen.route),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  },
);
