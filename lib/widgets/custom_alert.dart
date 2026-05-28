import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AlertVariant {
  primary,
  secondary,
  destructive,
  success,
  info,
  warning,
  mono,
}

enum AlertAppearance {
  solid,
  outline,
  light,
}

enum AlertSize {
  sm,
  md,
  lg,
}

/// A premium, highly customizable Alert Banner Widget in Flutter
/// inspired directly by shadcn/Radix alert structure.
class CustomAlert extends StatefulWidget {
  final AlertVariant variant;
  final AlertAppearance appearance;
  final AlertSize size;
  final bool close;
  final VoidCallback? onClose;
  final Widget? icon;
  final String? title;
  final String? description;
  final Widget? toolbar;
  final Widget? child;

  const CustomAlert({
    Key? key,
    this.variant = AlertVariant.secondary,
    this.appearance = AlertAppearance.solid,
    this.size = AlertSize.md,
    this.close = false,
    this.onClose,
    this.icon,
    this.title,
    this.description,
    this.toolbar,
    this.child,
  }) : super(key: key);

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    // 1. Fetch style colors based on variant & appearance
    final colors = _getAlertColors();
    final Color bgColor = colors['bg']!;
    final Color textColor = colors['text']!;
    final Color borderColors = colors['border']!;
    final Color iconColor = colors['icon']!;

    // 2. Fetch size values
    final double padding = _getPadding();
    final double titleSize = _getTitleSize();
    final double descSize = _getDescSize();
    final double gap = widget.size == AlertSize.sm ? 8.0 : (widget.size == AlertSize.md ? 10.0 : 12.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(widget.size == AlertSize.sm ? 8 : 12),
        border: Border.all(
          color: widget.appearance == AlertAppearance.outline || widget.appearance == AlertAppearance.light
              ? borderColors
              : Colors.transparent,
          width: 1,
        ),
        boxShadow: widget.appearance == AlertAppearance.solid
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Alert Icon
          if (widget.icon != null) ...[
            IconTheme(
              data: IconThemeData(
                color: iconColor,
                size: widget.size == AlertSize.sm ? 16 : (widget.size == AlertSize.md ? 20 : 24),
              ),
              child: widget.icon!,
            ),
            SizedBox(width: gap),
          ],

          // Content Area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null)
                  Text(
                    widget.title!,
                    style: GoogleFonts.plusJakartaSans(
                      color: textColor,
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                if (widget.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.description!,
                    style: GoogleFonts.plusJakartaSans(
                      color: textColor.withOpacity(widget.appearance == AlertAppearance.solid ? 0.9 : 0.8),
                      fontSize: descSize,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ],
                if (widget.child != null) ...[
                  const SizedBox(height: 8),
                  widget.child!,
                ],
                if (widget.toolbar != null) ...[
                  const SizedBox(height: 8),
                  widget.toolbar!,
                ],
              ],
            ),
          ),

          // Close button
          if (widget.close) ...[
            SizedBox(width: gap),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = false;
                });
                if (widget.onClose != null) widget.onClose!();
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.close,
                  size: widget.size == AlertSize.sm ? 14 : 16,
                  color: textColor.withOpacity(0.65),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  double _getPadding() {
    switch (widget.size) {
      case AlertSize.sm:
        return 10.0;
      case AlertSize.lg:
        return 16.0;
      case AlertSize.md:
      default:
        return 14.0;
    }
  }

  double _getTitleSize() {
    switch (widget.size) {
      case AlertSize.sm:
        return 12.5;
      case AlertSize.lg:
        return 15.5;
      case AlertSize.md:
      default:
        return 14.0;
    }
  }

  double _getDescSize() {
    switch (widget.size) {
      case AlertSize.sm:
        return 11.0;
      case AlertSize.lg:
        return 13.0;
      case AlertSize.md:
      default:
        return 12.0;
    }
  }

  Map<String, Color> _getAlertColors() {
    Color bg = Colors.grey;
    Color text = Colors.black;
    Color border = Colors.grey;
    Color icon = Colors.black;

    switch (widget.appearance) {
      case AlertAppearance.solid:
        switch (widget.variant) {
          case AlertVariant.primary:
            bg = const Color(0xFF0284C7);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.success:
            bg = const Color(0xFF16A34A);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.warning:
            bg = const Color(0xFFD97706);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.destructive:
            bg = const Color(0xFFDC2626);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.info:
            bg = const Color(0xFF7C3AED);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.mono:
            bg = const Color(0xFF0F172A);
            text = Colors.white;
            icon = Colors.white;
            break;
          case AlertVariant.secondary:
          default:
            bg = const Color(0xFF64748B);
            text = Colors.white;
            icon = Colors.white;
            break;
        }
        border = bg;
        break;

      case AlertAppearance.light:
        switch (widget.variant) {
          case AlertVariant.primary:
            bg = const Color(0xFFF0F9FF);
            border = const Color(0xFFBAE6FD);
            text = const Color(0xFF0369A1);
            break;
          case AlertVariant.success:
            bg = const Color(0xFFF0FDF4);
            border = const Color(0xFFBBF7D0);
            text = const Color(0xFF15803D);
            break;
          case AlertVariant.warning:
            bg = const Color(0xFFFFFBEB);
            border = const Color(0xFFFEF3C7);
            text = const Color(0xFFB45309);
            break;
          case AlertVariant.destructive:
            bg = const Color(0xFFFEF2F2);
            border = const Color(0xFFFEE2E2);
            text = const Color(0xFFB91C1C);
            break;
          case AlertVariant.info:
            bg = const Color(0xFFF5F3FF);
            border = const Color(0xFFDDD6FE);
            text = const Color(0xFF6D28D9);
            break;
          case AlertVariant.mono:
            bg = const Color(0xFFF8FAFC);
            border = const Color(0xFFE2E8F0);
            text = const Color(0xFF0F172A);
            break;
          case AlertVariant.secondary:
          default:
            bg = const Color(0xFFF8FAFC);
            border = const Color(0xFFE2E8F0);
            text = const Color(0xFF475569);
            break;
        }
        icon = text;
        break;

      case AlertAppearance.outline:
        bg = Colors.white;
        switch (widget.variant) {
          case AlertVariant.primary:
            border = const Color(0xFF0284C7);
            text = const Color(0xFF0284C7);
            break;
          case AlertVariant.success:
            border = const Color(0xFF16A34A);
            text = const Color(0xFF16A34A);
            break;
          case AlertVariant.warning:
            border = const Color(0xFFD97706);
            text = const Color(0xFFD97706);
            break;
          case AlertVariant.destructive:
            border = const Color(0xFFDC2626);
            text = const Color(0xFFDC2626);
            break;
          case AlertVariant.info:
            border = const Color(0xFF7C3AED);
            text = const Color(0xFF7C3AED);
            break;
          case AlertVariant.mono:
            border = const Color(0xFF0F172A);
            text = const Color(0xFF0F172A);
            break;
          case AlertVariant.secondary:
          default:
            border = const Color(0xFF64748B);
            text = const Color(0xFF64748B);
            break;
        }
        icon = text;
        break;
    }

    return {'bg': bg, 'text': text, 'border': border, 'icon': icon};
  }
}
