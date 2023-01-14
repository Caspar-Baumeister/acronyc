import 'package:acronyc_app/pages/landing_page/landing_page.dart';
import 'package:acronyc_app/pages/asana_search_page/asana_search_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingPage()),
    GoRoute(
        path: '/asanas', builder: (context, state) => const AsanaSearchPage()),
  ],
);
