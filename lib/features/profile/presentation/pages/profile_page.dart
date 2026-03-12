import 'package:cineverse/core/router/app_router.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_controller.dart';
import 'package:cineverse/features/favorites/data/repositories/favorites_repository.dart';
import 'package:cineverse/features/ticket_booking/data/repositories/booking_repository.dart';
import 'package:cineverse/shared/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.user;
    final favsAsync = ref.watch(favoritesStreamProvider);
    final wlAsync = ref.watch(watchlistStreamProvider);
    final booksAsync = ref.watch(bookingsStreamProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: _ProfileHeader(
              displayName: user?.displayName,
              email: user?.email,
              photoUrl: user?.photoURL,
              isVerified: user?.isEmailVerified ?? false,
            ),
          ),

          // Stats row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Row(
                children: [
                  _StatCard(
                    label: 'Favourites',
                    value: favsAsync.when(
                      data: (l) => '${l.length}',
                      loading: () => '–',
                      error: (_, __) => '0',
                    ),
                    icon: Icons.favorite_outline,
                    onTap: () => context.goNamed('favorites'),
                  ),
                  const SizedBox(width: 10),
                  _StatCard(
                    label: 'Watchlist',
                    value: wlAsync.when(
                      data: (l) => '${l.length}',
                      loading: () => '–',
                      error: (_, __) => '0',
                    ),
                    icon: Icons.bookmark_outline,
                    onTap: () => context
                        .goNamed('favorites', extra: {'watchlist': true}),
                  ),
                  const SizedBox(width: 10),
                  _StatCard(
                    label: 'Bookings',
                    value: booksAsync.when(
                      data: (l) => '${l.length}',
                      loading: () => '–',
                      error: (_, __) => '0',
                    ),
                    icon: Icons.confirmation_number_outlined,
                    onTap: () => context.goNamed('bookingHistory'),
                  ),
                ],
              ),
            ),
          ),

          // Account section
          SliverToBoxAdapter(child: _sectionLabel('Account', context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _Tile(
                    Icons.person_outline,
                    'Edit Profile',
                    onTap: () => context.goNamed('editProfile'),
                  ),
                  _Tile(
                    Icons.notifications_outlined,
                    'Notifications',
                    onTap: () => context.goNamed('notifications'),
                  ),
                  _Tile(
                    Icons.lock_outline,
                    'Privacy & Security',
                    onTap: () => context.goNamed('privacy'),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: _sectionLabel('Preferences', context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const ThemeToggleTile(),
                  _Tile(
                    Icons.language,
                    'Language',
                    subtitle: 'English',
                    onTap: () => context.goNamed('language'),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: _sectionLabel('Support', context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _Tile(
                    Icons.help_outline,
                    'Help & Support',
                    onTap: () => context.goNamed('help'),
                  ),
                  _Tile(
                    Icons.info_outline,
                    'About CineVerse',
                    onTap: () => context.goNamed('about'),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // Sign out
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton.icon(
                onPressed: () async {
                  final ok = await _confirmSignOut(context);
                  if (ok) {
                    ref.read(authControllerProvider.notifier).signOut();
                    ref.read(appRouterProvider).go('/auth/login');
                  }
                },
                icon: const Icon(Icons.logout, color: AppColors.error),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Future<bool> _confirmSignOut(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: AppColors.surface(context),
            title: Text(
              'Sign Out',
              style: TextStyle(color: AppColors.textPrimary(context)),
            ),
            content: Text(
              'Are you sure you want to sign out?',
              style: TextStyle(color: AppColors.textSecondary(context)),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.textSecondary(context)),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final bool isVerified;

  const _ProfileHeader({
    this.displayName,
    this.email,
    this.photoUrl,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    final initial = displayName?.isNotEmpty == true
        ? displayName![0].toUpperCase()
        : email?[0].toUpperCase() ?? 'U';

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.amber600.withValues(alpha: 0.12),
            AppColors.scaffold(context),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: photoUrl != null
                ? ClipOval(child: Image.network(photoUrl!, fit: BoxFit.cover))
                : Center(
                    child: Text(
                      initial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 14),
          Text(
            displayName ?? 'CineVerse User',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(email ?? '', style: Theme.of(context).textTheme.bodySmall),
          if (isVerified) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.verifiedBg(context),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.verifiedBorder(context)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    color: AppColors.verified(context),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Email Verified',
                    style: TextStyle(
                      color: AppColors.verified(context),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border(context)),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.amber600, size: 22),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.amber600,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.textSecondary(context),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sectionLabel(String title, BuildContext ctx) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.amber600,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
      ),
    );

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _Tile(this.icon, this.title, {this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: AppColors.surface(context),
        leading: Icon(icon, color: AppColors.amber600, size: 22),
        title: Text(
          title,
          style: TextStyle(
            color: cs.onSurface,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: TextStyle(
                  color: AppColors.textSecondary(context),
                  fontSize: 12,
                ),
              )
            : null,
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.textDisabled(context),
          size: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      ),
    );
  }
}
