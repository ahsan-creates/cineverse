import 'package:cineverse/features/auth/presentation/controllers/auth_controller.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_state.dart';
import 'package:cineverse/features/auth/presentation/pages/login_page.dart';
import 'package:cineverse/features/auth/presentation/pages/signup_page.dart';
import 'package:cineverse/features/favorites/presentation/pages/favorites_page.dart';
import 'package:cineverse/features/home/presentation/pages/main_page.dart';
import 'package:cineverse/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:cineverse/features/profile/presentation/pages/about_page.dart';
import 'package:cineverse/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:cineverse/features/profile/presentation/pages/help_page.dart';
import 'package:cineverse/features/profile/presentation/pages/language_page.dart';
import 'package:cineverse/features/profile/presentation/pages/notifications_page.dart';
import 'package:cineverse/features/profile/presentation/pages/privacy_page.dart';
import 'package:cineverse/features/search/presentation/pages/search_page.dart';
import 'package:cineverse/features/ticket_booking/data/models/booking_model.dart';
import 'package:cineverse/features/ticket_booking/presentation/pages/booking_confirmation_page.dart';
import 'package:cineverse/features/ticket_booking/presentation/pages/booking_history_page.dart';
import 'package:cineverse/features/ticket_booking/presentation/pages/booking_page.dart';
import 'package:cineverse/features/tv_shows/presentation/pages/tv_show_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    // Always start at login; redirect sends authenticated users to /home.
    initialLocation: '/auth/login',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isAuthRoute = state.matchedLocation.startsWith('/auth');

      if (!isAuthenticated && !isAuthRoute) return '/auth/login';
      if (isAuthenticated && isAuthRoute) return '/home';
      return null;
    },
    routes: [
      // ── Auth ──────────────────────────────────────────────────────
      GoRoute(path: '/auth/login', name: 'login', builder: (_, __) => const LoginPage()),
      GoRoute(
        path: '/auth/signup',
        name: 'signup',
        builder: (_, __) => const SignupPage(),
      ),

      // ── Main shell ────────────────────────────────────────────────
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (_, __) => const MainPage(),
        routes: [
          // Movies
          GoRoute(
            path: 'movie/:id',
            name: 'movieDetail',
            builder: (_, state) =>
                MovieDetailPage(movieId: int.parse(state.pathParameters['id']!)),
            routes: [
              GoRoute(
                path: 'book',
                name: 'bookMovie',
                builder: (_, state) {
                  final extra = state.extra as Map<String, dynamic>? ?? {};
                  return BookingPage(
                    movieId: int.parse(state.pathParameters['id']!),
                    movieTitle: extra['title'] as String? ?? '',
                    posterPath: extra['posterPath'] as String?,
                  );
                },
              ),
            ],
          ),

          // TV Shows
          GoRoute(
            path: 'tvshow/:id',
            name: 'tvShowDetail',
            builder: (_, state) =>
                TvShowDetailPage(tvShowId: int.parse(state.pathParameters['id']!)),
          ),

          // Search
          GoRoute(path: 'search', name: 'search', builder: (_, __) => const SearchPage()),

          // Favorites & Watchlist
          GoRoute(
            path: 'library',
            name: 'favorites',
            builder: (_, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return FavoritesPage(showWatchlist: extra?['watchlist'] == true);
            },
          ),

          // Booking history
          GoRoute(
            path: 'bookings',
            name: 'bookingHistory',
            builder: (_, __) => const BookingHistoryPage(),
          ),

          // Booking confirmation
          GoRoute(
            path: 'booking-confirmed',
            name: 'bookingConfirmation',
            builder: (_, state) =>
                BookingConfirmationPage(booking: state.extra as Booking),
          ),

          // Profile sub-pages
          GoRoute(
            path: 'edit-profile',
            name: 'editProfile',
            builder: (_, __) => const EditProfilePage(),
          ),
          GoRoute(
            path: 'notifications',
            name: 'notifications',
            builder: (_, __) => const NotificationsPage(),
          ),
          GoRoute(
            path: 'privacy',
            name: 'privacy',
            builder: (_, __) => const PrivacyPage(),
          ),
          GoRoute(
            path: 'language',
            name: 'language',
            builder: (_, __) => const LanguagePage(),
          ),
          GoRoute(path: 'help', name: 'help', builder: (_, __) => const HelpPage()),
          GoRoute(path: 'about', name: 'about', builder: (_, __) => const AboutPage()),
        ],
      ),
    ],
    errorBuilder: (_, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.error}'))),
  );
}
