import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_assist/controllers/history_jobs/job_history_controller.dart';
import 'package:priority_assist/controllers/home/home_controller.dart';
import 'package:priority_assist/controllers/progress_job/progress_job_controller.dart';

import 'package:priority_assist/themes/app_colors.dart';
import 'package:priority_assist/utils/routes/app_names.dart';
import 'package:priority_assist/views/common_widgets/progress_job_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final homeState = ref.watch(homeProvider);
    final homeStateRead = ref.read(homeProvider.notifier);

    final historyState = ref.read(historyJobProvider.notifier);
    final progressState = ref.read(progressJobProvider.notifier);
    final job = homeState.progressJob;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.push(AppNames.queListScreen.route);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.appBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: screenHeight / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.group_sharp, size: 60),
                            const SizedBox(height: 8),
                            Text(
                              "Queue Jobs",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.push(AppNames.jobsHistoryScreen.route);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.appBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: screenHeight / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.note, size: 60),
                            const SizedBox(height: 8),
                            Text(
                              "Job's History",
                              style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text('Works in Progress'),

              //  Job List
              homeState.isLoading
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.grey),
                      ),
                    )
                  : homeState.progressJob.isEmpty
                  ? const Expanded(
                      child: Center(child: Text('No Jobs in Progress.')),
                    )
                  : Expanded(
                      child: JobCard(
                        job: job.first,
                        onComplete: () async {
                          await historyState.saveToHive(
                            name: job.first['name'],
                            address: job.first['address'],
                            serviceType: job.first['serviceType'],
                            priority: job.first['priority'],
                            complete: 'yes',
                          );
                          progressState.clearOnlyProgressJobs();
                          homeStateRead.clearProgressJobsState();
                        },
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(AppNames.addJobsScreen.route),
          backgroundColor: AppColors.appBlue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
