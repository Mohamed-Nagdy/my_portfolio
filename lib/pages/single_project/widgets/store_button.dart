import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../themes/style.dart';
import '../../../utils/help_functions.dart';

class StoreButton extends StatelessWidget {
  const StoreButton({super.key, this.url, this.icon, this.title});
  final String? url;
  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrlString('$url');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDark(context) ? graySwatch.shade800 : graySwatch.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              '$title',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
