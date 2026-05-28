import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A premium Flutter realization of the React Aceternity UI `ContainerScroll` component.
/// It creates a 3D scroll-driven perspective tilt-and-scale effect on its [child] widget.
class ContainerScroll extends StatefulWidget {
  final Widget titleComponent;
  final Widget child;

  const ContainerScroll({
    Key? key,
    required this.titleComponent,
    required this.child,
  }) : super(key: key);

  @override
  State<ContainerScroll> createState() => _ContainerScrollState();
}

class _ContainerScrollState extends State<ContainerScroll> {
  final GlobalKey _containerKey = GlobalKey();
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    // Monitor scroll events automatically without requiring an external ScrollController
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _updateProgress();
        return false;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Schedule updating the progress state on layout updates
          WidgetsBinding.instance.addPostFrameCallback((_) => _updateProgress());

          // Map progress [0.0, 1.0] to scale: 0.85 to 1.0 on mobile
          double scale = 0.88 + (0.12 * _progress);

          // rotateX: starts at 20 degrees (0.35 rad) and goes down to 0 degrees as progress goes to 1.0
          double angle = (20.0 * (1.0 - _progress)) * math.pi / 180.0;

          // translateY: starts at 0 and goes up to -30
          double translate = -35.0 * _progress;

          return Column(
            key: _containerKey,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header title component with translation and opacity
              Transform.translate(
                offset: Offset(0, translate),
                child: Opacity(
                  opacity: (1.0 - (_progress * 0.15)).clamp(0.0, 1.0),
                  child: widget.titleComponent,
                ),
              ),
              const SizedBox(height: 16),
              // Card component with 3D perspective, scale, and premium box shadows
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // 3D Perspective!
                  ..rotateX(angle)
                  ..scale(scale),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: const Color(0xFF6C6C6C), width: 3.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 18,
                        offset: const Offset(0, 9),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.24),
                        blurRadius: 32,
                        offset: const Offset(0, 32),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 250, // Height that is optimal for mobile devices
                      width: double.infinity,
                      color: const Color(0xFF1E293B),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _updateProgress() {
    if (!mounted) return;
    final RenderObject? renderObject = _containerKey.currentContext?.findRenderObject();
    if (renderObject is! RenderBox) return;

    // Find the position of the widget relative to the viewport
    final position = renderObject.localToGlobal(Offset.zero);
    final widgetTop = position.dy;
    final screenHeight = MediaQuery.of(context).size.height;

    // Start progress when card is near the lower half of screen (e.g., 85%),
    // and complete progress (1.0) when it reaches near the top of the screen (e.g., 20%).
    final double startY = screenHeight * 0.85;
    final double endY = screenHeight * 0.22;

    double progress = (startY - widgetTop) / (startY - endY);
    progress = progress.clamp(0.0, 1.0);

    if ((progress - _progress).abs() > 0.001) {
      setState(() {
        _progress = progress;
      });
    }
  }
}
