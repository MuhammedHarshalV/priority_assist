import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:priority_assist/controllers/queue_jobs/queue_job_controller.dart';

import 'package:priority_assist/themes/app_colors.dart';
import 'package:priority_assist/utils/routes/app_names.dart';
import 'package:priority_assist/views/common_widgets/job_details_card.dart';

class QueueListScreen extends ConsumerWidget {
  const QueueListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queuestate = ref.watch(queueJobProvider);
    final job = queuestate.queueJobs;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: queuestate.isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.grey))
              : queuestate.queueJobs.isEmpty
              ? Center(child: Text('No Jobs in Queuing.'))
              : ListView.builder(
                  itemCount: job.length,
                  itemBuilder: (context, index) {
                    final reversedList = queuestate.queueJobs.reversed.toList();
                    final job = reversedList[index];
                    return JobDetailsCard(
                      job: job,
                      index: index + 1,
                      isQueue: true,
                    );
                  },
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
