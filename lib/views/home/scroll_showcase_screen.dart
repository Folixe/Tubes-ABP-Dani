import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/container_scroll_animation.dart';

class ScrollShowcaseScreen extends StatelessWidget {
  const ScrollShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19), // Ultra-premium deep dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '3D Scroll Animation Demo',
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Spacing - Encouraging user to scroll
            Container(
              height: 400,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: const Icon(
                      Icons.mouse_rounded,
                      color: Color(0xFF38BDF8),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Rasakan Pengalaman Premium',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Scroll ke bawah secara perlahan untuk melihat efek animasi 3D Perspective & Scaling pada panel di bawah.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Icon(
                    Icons.keyboard_double_arrow_down_rounded,
                    color: Color(0xFF38BDF8),
                    size: 24,
                  ),
                ],
              ),
            ),

            // The HeroScroll Component
            ContainerScroll(
              titleComponent: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'UNLEASH THE POWER OF',
                      style: GoogleFonts.shareTechMono(
                        color: const Color(0xFF38BDF8),
                        fontSize: 12,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'SITANGKAP Mobile\n',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Scroll Animations',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                                ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // High Quality Maritime Ocean Ship Stock Image from Unsplash
                  Image.network(
                    'https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?q=80&w=2074',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(color: Color(0xFF38BDF8)),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback premium maritime gradient in case of offline / error loading image
                      return Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF0F172A), Color(0xFF0284C7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.directions_boat_rounded, size: 80, color: Colors.white30),
                        ),
                      );
                    },
                  ),
                  // Dark Vignette/Overlay for high-contrast details
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.4), Colors.transparent, Colors.black.withOpacity(0.75)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Ocean Vessel telemetry HUD info overlay
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, color: Colors.greenAccent, size: 8),
                          const SizedBox(width: 6),
                          Text(
                            'VESSEL ONLINE',
                            style: GoogleFonts.shareTechMono(color: Colors.white, fontSize: 9, letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Kapal Motor Mina Jaya X',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Sistem Sonar & Detektor Ikan Aktif',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF38BDF8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.anchor_rounded, color: Colors.white, size: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Bottom Spacing - Allows the scroll animation to fully complete and flatten out
            Container(
              height: 500,
              width: double.infinity,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.white24,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Animasi 3D Selesai Terbuka',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF38BDF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ketika Anda men-scroll sampai ke sini, kartu visual di atas telah berotasi penuh kembali ke posisi normal (0°) dan membesar 100%. Ini sama seperti dynamic scroll experience di website-website premium modern.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white60,
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.08),
                      foregroundColor: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.white.withOpacity(0.12)),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, size: 18),
                    label: Text(
                      'Kembali ke Dashboard',
                      style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
