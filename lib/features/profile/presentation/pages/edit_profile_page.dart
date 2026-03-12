import 'package:cineverse/core/providers/firebase_providers.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_controller.dart';
import 'package:cineverse/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:cineverse/features/auth/presentation/widgets/gradient_button.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _nameCtrl = TextEditingController();
  final _photoCtrl = TextEditingController();
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authControllerProvider).user;
    _nameCtrl.text = user?.displayName ?? '';
    _photoCtrl.text = user?.photoURL ?? '';
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _photoCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_nameCtrl.text.trim().isEmpty) {
      setState(() => _error = 'Name cannot be empty');
      return;
    }
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final auth = ref.read(firebaseAuthProvider);
      await auth.currentUser?.updateDisplayName(_nameCtrl.text.trim());
      if (_photoCtrl.text.isNotEmpty) {
        await auth.currentUser?.updatePhotoURL(_photoCtrl.text.trim());
      }
      await auth.currentUser?.reload();
      // Force controller rebuild
      ref.invalidate(authControllerProvider);
      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated!')),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: CvAppBar(
        title: 'Edit Profile',
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.icon(context)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width > 600 ? size.width * 0.2 : 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Avatar preview
            Consumer(
              builder: (_, ref, __) {
                final user = ref.watch(authControllerProvider).user;
                final initial = user?.displayName?.isNotEmpty == true
                    ? user!.displayName![0].toUpperCase()
                    : 'U';
                return Container(
                  width: 88,
                  height: 88,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.primaryGradient,
                  ),
                  child: Center(
                    child: Text(
                      initial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),

            if (_error != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Text(
                  _error!,
                  style: const TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ),
              const SizedBox(height: 16),
            ],

            AuthTextField(
              controller: _nameCtrl,
              hintText: 'Display Name',
              prefixIcon: Icons.person_outline,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Enter a name';
                return null;
              },
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _photoCtrl,
              hintText: 'Photo URL (optional)',
              prefixIcon: Icons.image_outlined,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 32),
            GradientButton(
              text: 'Save Changes',
              isLoading: _isLoading,
              onPressed: _isLoading ? null : _save,
            ),
          ],
        ),
      ),
    );
  }
}
