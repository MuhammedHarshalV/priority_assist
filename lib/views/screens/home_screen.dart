import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_assist/controllers/home/home_controller.dart';
import 'package:priority_assist/themes/app_colors.dart';
import 'package:priority_assist/utils/routes/app_names.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final homeState = ref.watch(homeProvider);
    bool log2 = homeState.isDatabaseEmpty;
    log(log2.toString());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: screenHeight / 4,
                      child: Column(
                        children: [
                          Icon(Icons.group_sharp, size: 100),
                          Center(
                            child: Text(
                              "Queue Jobs",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: screenHeight / 4,
                      child: Column(
                        children: [
                          Icon(Icons.note, size: 100),
                          Center(
                            child: Text(
                              "Job's History",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            context.push(AppNames.addJobsScreen.route);
          },
          icon: Icon(Icons.add, color: Theme.of(context).focusColor),
        ),
      ),
    );
  }
}
