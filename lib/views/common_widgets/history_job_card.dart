import 'package:flutter/material.dart';
import 'package:priority_assist/themes/app_colors.dart';

class HistoryJobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final int index;
  final bool? isQueue;

  const HistoryJobCard({
    super.key,
    required this.job,
    required this.index,
    this.isQueue = false,
  });

  Color _priorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final priority = job['priority'] ?? '';
    final isComplete = job['complete'] == 'yes';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isComplete ? Colors.green : Colors.red),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                index.toString(),
                style: TextStyle(color: AppColors.appWhite),
              ),
            ),
            Center(
              child: Text(
                isComplete
                    ? 'Completed Job'
                    : isQueue!
                    ? 'Queuing'
                    : 'Not Accepted',
                style: TextStyle(
                  color: isComplete ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job['name'] ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _priorityColor(priority).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _priorityColor(priority)),
                  ),
                  child: Text(
                    priority,
                    style: TextStyle(
                      color: _priorityColor(priority),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    job['address'] ?? '',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.build, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  job['serviceType'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),

            const SizedBox(height: 8),
            if (isQueue!)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Accept'),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
