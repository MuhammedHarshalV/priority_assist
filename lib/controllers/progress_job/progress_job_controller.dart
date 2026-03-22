import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:priority_assist/controllers/progress_job/progress_job_state.dart';

class ProgressJobNotifier extends StateNotifier<ProgressJobState> {
  ProgressJobNotifier() : super(const ProgressJobState()) {}

  //  Open Box 
  Future<Box> _openBox() async {
    if (Hive.isBoxOpen('progress_job')) {
      return Hive.box('progress_job');
    }
    return await Hive.openBox('progress_job');
  }

  //  Set Date 
  void setDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  //  Set Time 
  void setTime(TimeOfDay time) {
    state = state.copyWith(time: time);
  }

  //  Save ─
  Future<bool> saveToHive({
    required String name,
    required String address,
    required String serviceType,
    required String priority,
  }) async {
    try {
      final box = await _openBox();

      final requestData = {
        'name': name,
        'address': address,
        'serviceType': serviceType,
        'priority': priority,
      };

      await box.add(requestData);
      debugPrint('Saved: $requestData');
      return true;
    } catch (e) {
      debugPrint('saveToHive error: $e');
      return false;
    }
  }

  //clear hive
  Future<void> clearOnlyProgressJobs() async {
    final box = await Hive.openBox('progress_job');
    await box.clear();
  }
}

//  Provider 
final progressJobProvider =
    StateNotifierProvider<ProgressJobNotifier, ProgressJobState>((ref) {
      return ProgressJobNotifier();
    });
