enum AppNames {
  splashScreen('/'),

  //home screens
  homeScreen('/home_screen'),
  acceptScreen('/accept_screen'),
  jobsHistoryScreen('/jobs_history_screen'),
  queuescreenAccept('/queue_accept_screen'),
  queListScreen('/queue_list_screen'),

  addJobsScreen('/add_jobs_screen');

  final String route;
  const AppNames(this.route);
}
