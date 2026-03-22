enum AppNames {
  splashScreen('/'),

  //home screens
  homeScreen('/home_screen'),
  acceptScreen('/accept_screen'),

  addJobsScreen('/add_jobs_screen');

  final String route;
  const AppNames(this.route);
}
