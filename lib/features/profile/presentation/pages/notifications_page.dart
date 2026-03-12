import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _newReleases = true;
  bool _bookingReminder = true;
  bool _recommendations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: CvAppBar(
        title: 'Notifications',
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.icon(context)),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _sectionHeader('Channels', context),
          _switchTile(
            'Push Notifications',
            'Get alerts on your device',
            _pushEnabled,
            (v) => setState(() => _pushEnabled = v),
            context,
          ),
          _switchTile(
            'Email Notifications',
            'Receive emails from CineVerse',
            _emailEnabled,
            (v) => setState(() => _emailEnabled = v),
            context,
          ),
          const SizedBox(height: 20),
          _sectionHeader('Topics', context),
          _switchTile(
            'New Releases',
            'Be first to know about new movies',
            _newReleases,
            (v) => setState(() => _newReleases = v),
            context,
          ),
          _switchTile(
            'Booking Reminders',
            'Reminders before your screenings',
            _bookingReminder,
            (v) => setState(() => _bookingReminder = v),
            context,
          ),
          _switchTile(
            'Recommendations',
            'Personalised picks for you',
            _recommendations,
            (v) => setState(() => _recommendations = v),
            context,
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String t, BuildContext ctx) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          t.toUpperCase(),
          style: const TextStyle(
            color: AppColors.amber600,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      );

  Widget _switchTile(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
    BuildContext ctx,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: AppColors.surface(ctx),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(ctx).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: AppColors.textSecondary(ctx), fontSize: 12),
        ),
        trailing: Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.amber600,
        ),
      ),
    );
  }
}
