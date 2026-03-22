import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_assist/controllers/history_jobs/job_history_controller.dart';

import 'package:priority_assist/themes/app_colors.dart';
import 'package:priority_assist/utils/routes/app_names.dart';
import 'package:priority_assist/views/common_widgets/job_details_card.dart';

class JobsHistoryScreen extends ConsumerWidget {
  const JobsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historystate = ref.watch(historyJobProvider);
    final job = historystate.historyJob;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: historystate.isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.grey))
              : historystate.historyJob.isEmpty
              ? Center(child: Text('No Jobs in History.'))
              : ListView.builder(
                  itemCount: job.length < 16 ? job.length : 15,
                  itemBuilder: (context, index) {
                    final reversedList = historystate.historyJob.reversed
                        .toList();
                    final job = reversedList[index];
                    return JobDetailsCard(job: job, index: index + 1);
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
