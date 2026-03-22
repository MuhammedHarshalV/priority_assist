class JobsHistoryState {
  final List<Map<String, dynamic>> historyJob;
  final bool isLoading;
  const JobsHistoryState({this.historyJob = const [], this.isLoading = false});

  JobsHistoryState copyWith({
    List<Map<String, dynamic>>? historyJob,
    bool? isLoading,
  }) {
    return JobsHistoryState(
      historyJob: historyJob ?? this.historyJob,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
