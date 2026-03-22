class QueueJobState {
  final List<Map<String, dynamic>> queueJobs;
  final bool isLoading;
  const QueueJobState({this.queueJobs = const [], this.isLoading = false});

  QueueJobState copyWith({
    List<Map<String, dynamic>>? queueJobs,
    bool? isLoading,
  }) {
    return QueueJobState(
      queueJobs: queueJobs ?? this.queueJobs,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
