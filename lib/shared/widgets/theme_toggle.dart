import 'package:cineverse/core/providers/theme_provider.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeToggleTile extends ConsumerWidget {
  const ThemeToggleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;
    return _CvListTile(
      icon: isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      title: 'Appearance',
      subtitle: isDark ? 'Dark Mode' : 'Light Mode',
      trailing: Switch.adaptive(
        value: isDark,
        onChanged: (_) => ref.read(themeProvider.notifier).toggleTheme(),
        activeThumbColor: AppColors.amber600,
      ),
      onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
    );
  }
}

/// Reusable settings-style list tile — fully theme-safe.
class _CvListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const _CvListTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
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
        trailing: trailing ??
            Icon(
              Icons.chevron_right,
              color: AppColors.textDisabled(context),
              size: 20,
            ),
      ),
    );
  }
}
