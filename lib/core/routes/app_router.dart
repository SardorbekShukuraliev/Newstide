import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/models/NewsModel.dart';
import '../../features/home/presentation/pages/allnewspage.dart';
import '../../features/home/presentation/pages/homepage.dart';
import '../../features/home/presentation/pages/news_detail_page.dart';
import '../../features/home/presentation/pages/search_page.dart';
import '../../features/onboarding/presentation/pages/on_borading/onboard.dart';
import '../../features/settings/presentation/pages/about_us.dart';
import '../../features/settings/presentation/pages/help_support.dart';
import '../../features/settings/presentation/pages/legal_politics.dart';
import '../../features/settings/presentation/pages/main_settings_page.dart';
import '../../features/settings/presentation/pages/profile.dart';

late final GoRouter router;

Future<void> createRouter() async {
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seen_onboarding') ?? false;

  router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: seenOnboarding ? '/home' : '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/search_page',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SearchPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/news_details',
        pageBuilder: (context, state) {
          final news = state.extra as NewsModel;
          return CustomTransitionPage(
            key: state.pageKey,
            child: NewsDetailPage(news: news),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: '/all-news',
        pageBuilder: (context, state) {
          final title = state.uri.queryParameters['title'] ?? 'All News';
          return CustomTransitionPage(
            key: state.pageKey,
            child: AllNewsPage(title: title),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SettingsPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ComingSoonPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/politics',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: LegalPoliciesPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/support',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: HelpSupportPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/aboutus',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AboutUsPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
    ],
  );
}

Widget _fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
