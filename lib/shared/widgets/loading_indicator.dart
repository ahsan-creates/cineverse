import 'package:cineverse/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CineVerseLoader extends StatelessWidget {
  final double size;
  const CineVerseLoader({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.amber600,
          ),
        ),
      );
}
