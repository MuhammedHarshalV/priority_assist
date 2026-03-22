class HomeState {
  final bool isDatabaseEmpty;
  final bool isLoading;
  final List<Map<String, dynamic>> jobRequests;

  const HomeState({
    this.isDatabaseEmpty = false, 
    this.isLoading = false,
    this.jobRequests = const [],
  });

  HomeState copyWith({
    bool? isDatabaseEmpty, 
    bool? isLoading,
    List<Map<String, dynamic>>? jobRequests,
  }) {
    return HomeState(
      isDatabaseEmpty: isDatabaseEmpty ?? this.isDatabaseEmpty,
      isLoading: isLoading ?? this.isLoading,
      jobRequests: jobRequests ?? this.jobRequests,
    );
  }
}
