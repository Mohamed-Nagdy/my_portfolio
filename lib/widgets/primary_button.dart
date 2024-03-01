import 'package:flutter/material.dart';

import '../themes/style.dart';
import '../utils/help_functions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: isDark(context) ? graySwatch.shade50 : graySwatch.shade900,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color:
                    isDark(context) ? graySwatch.shade900 : graySwatch.shade50,
              ),
        ),
      ),
    );
  }
}
