import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:priority_assist/controllers/queue_jobs/queue_job_state.dart';

class QueueJobNotifier extends StateNotifier<QueueJobState> {
  QueueJobNotifier() : super(const QueueJobState()) {
    _init();
  }
  Future<void> _init() async {
    await checkDatabaseStatus();
  }

  //  Open Box 
  Future<Box> _openBox() async {
    if (Hive.isBoxOpen('queue_job')) {
      return Hive.box('queue_job');
    }
    return await Hive.openBox('queue_job');
  }

  //  Read All 
  Future<void> checkDatabaseStatus() async {
    try {
      state = state.copyWith(isLoading: true);

      final box = await _openBox();

      final List<Map<String, dynamic>> jobList = box.values.map((e) {
        final map = e as Map<dynamic, dynamic>;
        return map.map((key, value) => MapEntry(key.toString(), value));
      }).toList();

      log('All History data: $jobList');
      log(jobList.isNotEmpty.toString());

      state = state.copyWith(isLoading: false, queueJobs: jobList);
    } catch (e) {
      log('checkDatabaseStatus error: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  //  Save 
  Future<bool> saveToHive({
    required String name,
    required String address,
    required String serviceType,
    required String priority,
    required String queue,
  }) async {
    try {
      final box = await _openBox();

      final requestData = {
        'name': name,
        'address': address,
        'serviceType': serviceType,
        'priority': priority,
        'queue': queue,
      };

      await box.add(requestData);
      checkDatabaseStatus();
      debugPrint('Saved: $requestData');
      return true;
    } catch (e) {
      debugPrint('saveToHive error: $e');
      return false;
    }
  }
}

//  Provider 
final queueJobProvider = StateNotifierProvider<QueueJobNotifier, QueueJobState>(
  (ref) {
    return QueueJobNotifier();
  },
);
