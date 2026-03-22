import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:priority_assist/controllers/request_employee/request_employee_state.dart';

class RequestEmployeeNotifier extends StateNotifier<RequestEmployeeState> {
  // ─── Text Controllers ─────────────────────────────────────────
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();

  RequestEmployeeNotifier() : super(const RequestEmployeeState()) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });
    addressController.addListener(() {
      state = state.copyWith(address: addressController.text);
    });
    serviceTypeController.addListener(() {
      state = state.copyWith(serviceType: serviceTypeController.text);
    });
    priorityController.addListener(() {
      state = state.copyWith(priority: priorityController.text);
    });
  }

  // ─── Open Box ─────────────────────────────────────────────────
  Future<Box> _openBox() async {
    if (Hive.isBoxOpen('request_employee')) {
      return Hive.box('request_employee');
    }
    return await Hive.openBox('request_employee');
  }

  // ─── Set Date ─────────────────────────────────────────────────
  void setDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  // ─── Set Time ─────────────────────────────────────────────────
  void setTime(TimeOfDay time) {
    state = state.copyWith(time: time);
  }

  // ─── Save ─────────────────────────────────────────────────────
  Future<bool> saveToHive({
    required String name,
    required String address,
    required String serviceType,
    required String priority,
    required DateTime date,
    required TimeOfDay time,
  }) async {
    try {
      final box = await _openBox();

      final requestData = {
        'name': name,
        'address': address,
        'serviceType': serviceType,
        'priority': priority,
        'date': date.toIso8601String(),       // ← store as String
        'time': '${time.hour}:${time.minute}', // ← store as String
      };

      await box.add(requestData);
      debugPrint('Saved: $requestData');
      return true;
    } catch (e) {
      debugPrint('saveToHive error: $e');
      return false;
    }
  }

  // ─── Clear Form ───────────────────────────────────────────────
  void clearForm() {
    nameController.clear();
    addressController.clear();
    serviceTypeController.clear();
    priorityController.clear();
    state = const RequestEmployeeState();
  }

  // ─── Dispose ──────────────────────────────────────────────────
  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    serviceTypeController.dispose();
    priorityController.dispose();
    super.dispose();
  }
}

// ─── Provider ─────────────────────────────────────────────────
final requestEmployeeProvider =
    StateNotifierProvider<RequestEmployeeNotifier, RequestEmployeeState>((ref) {
      return RequestEmployeeNotifier();
    });