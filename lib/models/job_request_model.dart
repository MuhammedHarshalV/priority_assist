class JobRequestModel {
  final String name;
  final String address;
  final String jobType;
  final String priority;

  JobRequestModel({
    required this.name,
    required this.address,
    required this.jobType,
    required this.priority,
  });

  factory JobRequestModel.fromJson(Map<String, dynamic> json) {
    return JobRequestModel(
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      jobType: json['jobType'] as String? ?? '',
      priority: json['priority'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'jobType': jobType,
      'priority': priority,
    };
  }
}
