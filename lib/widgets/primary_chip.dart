import 'package:flutter/material.dart';

class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    required this.text,
    required this.color,
    super.key,
    this.onTap,
  });
  final String text;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                ),
          ),
          const SizedBox(width: 4),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: Icon(
                Icons.clear,
                color: color,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
