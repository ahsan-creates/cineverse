import 'package:cineverse/core/providers/theme_provider.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CvAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeToggle;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;

  const CvAppBar({
    super.key,
    required this.title,
    this.showThemeToggle = false,
    this.actions,
    this.centerTitle = false,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: AppColors.scaffold(context),
      foregroundColor: cs.onSurface,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        if (showThemeToggle) _ThemeToggleBtn(),
        ...?actions,
      ],
    );
  }
}

class _ThemeToggleBtn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;
    return IconButton(
      tooltip: isDark ? 'Light mode' : 'Dark mode',
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
      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
    );
  }
}
