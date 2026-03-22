
import 'package:flutter/material.dart';

class RequestEmployeeState {
  final String name;
  final String address;
  final String serviceType;
  final String priority;
  final DateTime? date;
  final TimeOfDay? time;

  const RequestEmployeeState({
    this.name = '',
    this.address = '',
    this.serviceType = '',
    this.priority = '',
    this.date,
    this.time,
  });

  RequestEmployeeState copyWith({
    String? name,
    String? address,
    String? serviceType,
    String? priority,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return RequestEmployeeState(
      name: name ?? this.name,
      address: address ?? this.address,
      serviceType: serviceType ?? this.serviceType,
      priority: priority ?? this.priority,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}