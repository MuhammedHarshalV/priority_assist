import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:priority_assist/controllers/home/home_controller.dart';

import 'package:priority_assist/controllers/queue_jobs/queue_job_controller.dart';
import 'package:priority_assist/models/job_request_model.dart';

class GotoQueScreen extends ConsumerWidget {
  final JobRequestModel jobRequestModel;
  const GotoQueScreen({super.key, required this.jobRequestModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.read(homeProvider.notifier);
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
             

              // Big Container with details
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Job Details',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(height: 30),

                        _buildDetailRow(
                          Icons.person,
                          'Name',
                          jobRequestModel.name,
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          Icons.location_on,
                          'Address',
                          jobRequestModel.address,
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          Icons.map,
                          'Location',
                          'Springfield City',
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          Icons.phone,
                          'Phone Number',
                          '+1 234 567 890',
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          Icons.work,
                          'Job Type',
                          jobRequestModel.jobType,
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          Icons.priority_high,
                          'Priority',
                          jobRequestModel.priority,
                          valueColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Accept / Decline Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(queueJobProvider.notifier)
                            .saveToHive(
                              name: jobRequestModel.name,
                              address: jobRequestModel.address,
                              serviceType: jobRequestModel.jobType,
                              priority: jobRequestModel.priority,
                              queue: 'yes',
                            );
                        homeState.checkDatabaseStatus();
                        context.pop(); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Queue',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String title,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueAccent, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
