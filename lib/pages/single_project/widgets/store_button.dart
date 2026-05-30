import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../themes/app_colors.dart';

class StoreButton extends StatefulWidget {
  const StoreButton({super.key, this.url, this.icon, this.title});
  final String? url;
  final IconData? icon;
  final String? title;

  @override
  State<StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<StoreButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => launchUrlString('${widget.url}',
            mode: LaunchMode.externalApplication),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          decoration: BoxDecoration(
            color: _hover ? c.glassStrong : c.glass,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: _hover ? c.accent.withValues(alpha: 0.5) : c.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: c.textPrimary),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('GET IT ON',
                      style: TextStyle(
                          color: c.textTertiary,
                          fontSize: 9,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600)),
                  Text('${widget.title}',
                      style: TextStyle(
                          color: c.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
