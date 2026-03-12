import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _faqs = [
  (
    'How do I book movie tickets?',
    'Go to any movie detail page and tap "Book Tickets". Select your preferred cinema, date, time, and seats, then confirm.'
  ),
  (
    'How do I add to my watchlist?',
    'On any movie or TV show detail page, tap the bookmark icon to add it to your watchlist.'
  ),
  (
    'Can I cancel a booking?',
    'Bookings can be managed from your Profile → My Bookings. Cancellation policies vary by cinema.'
  ),
  (
    'How do I switch between dark and light mode?',
    'Go to Profile → Preferences → Appearance and toggle the switch.'
  ),
  (
    'My account data isn\'t syncing',
    'Ensure you have a stable internet connection. Data is synced via Firebase in real-time.'
  ),
];

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: CvAppBar(
        title: 'Help & Support',
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.icon(context)),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.amber600.withValues(alpha: 0.15),
                  AppColors.orange600.withValues(alpha: 0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border(context)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.support_agent,
                  color: AppColors.amber600,
                  size: 36,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Support',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'support@cineverse.app',
                        style: TextStyle(
                          color: AppColors.amber600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Frequently Asked Questions'.toUpperCase(),
            style: const TextStyle(
              color: AppColors.amber600,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          ..._faqs.map((faq) => _FaqTile(question: faq.$1, answer: faq.$2)),
        ],
      ),
    );
  }
}

class _FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqTile({required this.question, required this.answer});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _expanded ? AppColors.amber600 : AppColors.border(context),
          width: _expanded ? 1.5 : 0.8,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => setState(() => _expanded = !_expanded),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            title: Text(
              widget.question,
              style: TextStyle(
                color: cs.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            trailing: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _expanded ? 0.5 : 0,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.amber600,
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.answer,
                style: TextStyle(
                  color: AppColors.textSecondary(context),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
