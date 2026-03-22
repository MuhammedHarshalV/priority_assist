import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:priority_assist/controllers/history_jobs/jobs_history_state.dart';

class JobsHistoryNotifier extends StateNotifier<JobsHistoryState> {
  JobsHistoryNotifier() : super(const JobsHistoryState()) {
    _init();
  }
  Future<void> _init() async {
    await checkDatabaseStatus();
  }

  //  Open Box ──
  Future<Box> _openBox() async {
    if (Hive.isBoxOpen('history_job')) {
      return Hive.box('history_job');
    }
    return await Hive.openBox('history_job');
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

      state = state.copyWith(isLoading: false, historyJob: jobList);
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
    required String complete,
  }) async {
    try {
      final box = await _openBox();

      final requestData = {
        'name': name,
        'address': address,
        'serviceType': serviceType,
        'priority': priority,
        'complete': complete,
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
final historyJobProvider =
    StateNotifierProvider<JobsHistoryNotifier, JobsHistoryState>((ref) {
      return JobsHistoryNotifier();
    });
