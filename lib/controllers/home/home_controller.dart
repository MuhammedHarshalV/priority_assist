import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:priority_assist/controllers/home/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState()) {
    _init();
  }

  Future<void> _init() async {
    await checkDatabaseStatus();
  }

  //  Open Box 
  Future<Box> _openBox() async {
    if (Hive.isBoxOpen('progress_job')) {
      return Hive.box('progress_job');
      // Hive.openBox('request_employee');
    }
    return await Hive.openBox('progress_job');
  }

  //  Read All ─
  Future<void> checkDatabaseStatus() async {
    try {
      state = state.copyWith(isLoading: true);

      final box = await _openBox();

      final List<Map<String, dynamic>> jobList = box.values.map((e) {
        final map = e as Map<dynamic, dynamic>;
        return map.map((key, value) => MapEntry(key.toString(), value));
      }).toList();

      log('All Progress data: $jobList');
      log(jobList.isNotEmpty.toString());

      state = state.copyWith(
        isDatabaseEmpty: jobList.isEmpty,
        isLoading: false,
        progressJob: jobList,
      );
    } catch (e) {
      log('checkDatabaseStatus error: $e');
      state = state.copyWith(isLoading: false, isDatabaseEmpty: true);
    }
  }

  Future<void> clearProgressJobsState() async {
    state = state.copyWith(progressJob: [], isDatabaseEmpty: true);
  }

  //  Add 
  Future<void> addJobRequest(Map<String, dynamic> jobData) async {
    try {
      final box = await _openBox();
      await box.add(jobData);
      log('Added: $jobData');
      await checkDatabaseStatus();
    } catch (e) {
      log('addJobRequest error: $e');
    }
  }

  //  Update 
  Future<void> updateJobRequest(
    int index,
    Map<String, dynamic> updatedData,
  ) async {
    try {
      final box = await _openBox();
      await box.putAt(index, updatedData);
      log('Updated at $index: $updatedData');
      await checkDatabaseStatus();
    } catch (e) {
      log('updateJobRequest error: $e');
    }
  }

  //  Delete 
  Future<void> deleteJobRequest(int index) async {
    try {
      final box = await _openBox();
      await box.deleteAt(index);
      log('Deleted at index: $index');
      await checkDatabaseStatus();
    } catch (e) {
      log('deleteJobRequest error: $e');
    }
  }

  //  Refresh ──
  void refresh() {
    checkDatabaseStatus();
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
