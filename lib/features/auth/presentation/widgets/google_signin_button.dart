import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleSigninButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const GoogleSigninButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: SvgPicture.asset('assets/icons/google_logo.svg'),
        label: const Text(
          'Continue with Google',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
