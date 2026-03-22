class HomeState {
  final bool isDatabaseEmpty;
  final bool isLoading;
  final List<Map<String, dynamic>> progressJob;

  const HomeState({
    this.isDatabaseEmpty = false,
    this.isLoading = false,
    this.progressJob = const [],
  });

  HomeState copyWith({
    bool? isDatabaseEmpty,
    bool? isLoading,
    List<Map<String, dynamic>>? progressJob,
  }) {
    return HomeState(
      isDatabaseEmpty: isDatabaseEmpty ?? this.isDatabaseEmpty,
      isLoading: isLoading ?? this.isLoading,
      progressJob: progressJob ?? this.progressJob,
    );
  }
}
