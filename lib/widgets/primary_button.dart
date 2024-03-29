import 'package:flutter/material.dart';

import '../themes/style.dart';
import '../utils/help_functions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    super.key,
    this.onTap,
    this.width,
  });
  final void Function()? onTap;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          margin:
              width == null ? null : const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isDark(context) ? graySwatch.shade50 : graySwatch.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isDark(context)
                      ? graySwatch.shade900
                      : graySwatch.shade50,
                ),
          ),
        ),
      ),
    );
  }
}
