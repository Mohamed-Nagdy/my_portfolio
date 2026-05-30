import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Reveals its [child] with a soft fade + upward slide the first time it
/// scrolls into view. Used to choreograph section entrances.
class Reveal extends StatefulWidget {
  const Reveal({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.offset = 28,
    this.duration = const Duration(milliseconds: 650),
  });

  final Widget child;
  final Duration delay;
  final double offset;
  final Duration duration;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  bool _shown = false;
  static int _seq = 0;
  late final String _key = 'reveal_${_seq++}';

  void _onVisible(VisibilityInfo info) {
    if (_shown) return;
    if (info.visibleFraction > 0.08) {
      Future.delayed(widget.delay, () {
        if (mounted) setState(() => _shown = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(_key),
      onVisibilityChanged: _onVisible,
      child: AnimatedSlide(
        offset: _shown ? Offset.zero : Offset(0, widget.offset / 100),
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: _shown ? 1 : 0,
          duration: widget.duration,
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
