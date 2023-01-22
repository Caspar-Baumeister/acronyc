import 'package:acronyc_app/pages/landing_page/landing_page.dart';
import 'package:acronyc_app/pages/asana_search_page/asana_search_page.dart';
import 'package:acronyc_app/pages/login_page/login_page.dart';
import 'package:acronyc_app/pages/register_page/register_page.dart';
import 'package:acronyc_app/pages/single_asana_page/single_asana_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingPage()),
    GoRoute(
        path: '/asanas', builder: (context, state) => const AsanaSearchPage()),
    GoRoute(
        path: '/asana', builder: (context, state) => const SingleAsanaPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/register', builder: (context, state) => const RegisterPage()),
  ],
);
