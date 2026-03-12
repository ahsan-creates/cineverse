import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _languages = [
  ('English', '🇺🇸', 'en'),
  ('Spanish', '🇪🇸', 'es'),
  ('French', '🇫🇷', 'fr'),
  ('German', '🇩🇪', 'de'),
  ('Japanese', '🇯🇵', 'ja'),
  ('Korean', '🇰🇷', 'ko'),
  ('Arabic', '🇸🇦', 'ar'),
  ('Hindi', '🇮🇳', 'hi'),
];

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selected = 'en';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: CvAppBar(
        title: 'Language',
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.icon(context)),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _languages.length,
        itemBuilder: (_, i) {
          final (name, flag, code) = _languages[i];
          final sel = _selected == code;
          return GestureDetector(
            onTap: () => setState(() => _selected = code),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: sel
                    ? AppColors.amber600.withValues(alpha: 0.1)
                    : AppColors.surface(context),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: sel ? AppColors.amber600 : AppColors.border(context),
                  width: sel ? 1.5 : 0.8,
                ),
              ),
              child: Row(
                children: [
                  Text(flag, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: cs.onSurface,
                        fontSize: 16,
                        fontWeight: sel ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (sel)
                    const Icon(Icons.check_circle, color: AppColors.amber600),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
