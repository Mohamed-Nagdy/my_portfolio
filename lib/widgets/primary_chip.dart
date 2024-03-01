import 'package:flutter/material.dart';

import '../themes/style.dart';
import '../utils/help_functions.dart';

class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    required this.text,
    super.key,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isDark(context) ? graySwatch.shade700 : graySwatch.shade200,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(width: 4),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.clear,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
