/// Name of Application
const kAppName = "Template";

/// AppRoutes
enum AppRoutes {
  onBoarding(name: 'On Boarding', path: '/on-boarding'),
  login(name: 'Login', path: '/login'),
  home(name: 'Home', path: '/home'),
  counters(name: 'Counters', path: '/counters');

  final String name;
  final String path;

  const AppRoutes({required this.name, required this.path});
}
