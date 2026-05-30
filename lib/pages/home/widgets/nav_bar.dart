import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../../../providers/theme_provider.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/buttons.dart';

const _navItems = <(String, String)>[
  ('Work', 'work'),
  ('Services', 'services'),
  ('Skills', 'skills'),
  ('About', 'about'),
];

class NavBar extends ConsumerStatefulWidget {
  const NavBar({required this.scrolled, required this.onNav, super.key});
  final bool scrolled;
  final void Function(String id) onNav;

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final isMobile = MediaQuery.sizeOf(context).width < 860;
    final themeMode = ref.watch(themeNotifier);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: widget.scrolled ? 18 : 0, sigmaY: widget.scrolled ? 18 : 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: widget.scrolled
                ? c.bg.withValues(alpha: 0.72)
                : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: widget.scrolled ? c.border : Colors.transparent,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                bottom: false,
                child: SizedBox(
                  height: 72,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1180),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            const _Wordmark(),
                            const Spacer(),
                            if (!isMobile) ...[
                              for (final item in _navItems)
                                _NavLink(
                                    label: item.$1,
                                    onTap: () => widget.onNav(item.$2)),
                              const SizedBox(width: 14),
                              _ThemeToggle(
                                isLight: themeMode == ThemeMode.light,
                                onTap: () => ref
                                    .read(themeNotifier.notifier)
                                    .changeTheme(),
                              ),
                              const SizedBox(width: 16),
                              GradientButton(
                                label: "Let's talk",
                                dense: true,
                                onTap: () => widget.onNav('contact'),
                              ),
                            ] else ...[
                              _ThemeToggle(
                                isLight: themeMode == ThemeMode.light,
                                onTap: () => ref
                                    .read(themeNotifier.notifier)
                                    .changeTheme(),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () =>
                                    setState(() => _menuOpen = !_menuOpen),
                                icon: Icon(_menuOpen ? Icons.close : Icons.menu,
                                    color: c.textPrimary),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isMobile && _menuOpen)
                Container(
                  width: double.infinity,
                  color: c.surface,
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final item in _navItems)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(item.$1,
                              style: TextStyle(
                                  color: c.textPrimary,
                                  fontWeight: FontWeight.w600)),
                          onTap: () {
                            setState(() => _menuOpen = false);
                            widget.onNav(item.$2);
                          },
                        ),
                      const SizedBox(height: 8),
                      GradientButton(
                        label: "Let's talk",
                        expand: true,
                        onTap: () {
                          setState(() => _menuOpen = false);
                          widget.onNav('contact');
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.4),
                  blurRadius: 14,
                  spreadRadius: -3),
            ],
          ),
          child: Image.asset('assets/branding/logo.png', width: 32, height: 32),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: studioWordmarkA,
                  style: TextStyle(
                      color: c.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
              TextSpan(
                  text: ' $studioWordmarkB',
                  style: TextStyle(
                      color: c.accent,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hover ? c.textPrimary : c.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle({required this.isLight, required this.onTap});
  final bool isLight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return IconButton(
      onPressed: onTap,
      tooltip: isLight ? 'Switch to dark' : 'Switch to light',
      icon: Icon(
        isLight ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        color: c.textSecondary,
        size: 20,
      ),
    );
  }
}
