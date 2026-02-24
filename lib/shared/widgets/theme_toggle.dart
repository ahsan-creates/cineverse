import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/providers/theme_provider.dart';
import '../../core/theme/app_theme.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: AppColors.cardBg(context),
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            isDark ? LucideIcons.moon : LucideIcons.sun,
            key: ValueKey(isDark),
            color: AppColors.amber600,
            size: 22,
          ),
        ),
        title: Text(
          'Theme',
          style: TextStyle(
            color: AppColors.textPrimary(context),
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          isDark ? 'Dark Mode' : 'Light Mode',
          style: TextStyle(
            color: AppColors.textSecondary(context),
            fontSize: 12,
          ),
        ),
        trailing: Switch.adaptive(
          value: isDark,
          onChanged: (_) => ref.read(themeProvider.notifier).toggleTheme(),
          activeThumbColor: AppColors.amber600,
          inactiveThumbColor: AppColors.amber400,
        ),
        onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
      ),
    );
  }
}

// Compact icon button version — put in AppBar actions
class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    return IconButton(
      tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) =>
            RotationTransition(turns: anim, child: child),
        child: Icon(
          isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          key: ValueKey(isDark),
          color: AppColors.amber600,
        ),
      ),
    );
  }
}
