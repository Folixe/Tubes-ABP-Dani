import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  final VoidCallback onLogout;
  const ProfileTab({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        // Profile Header
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Color(0xFF0EA5E9),
                        child: Text(
                          'BN', 
                          style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white, 
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: const Icon(Icons.camera_alt_rounded, size: 14, color: Color(0xFF0EA5E9)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text('Budi Nelayan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              const SizedBox(height: 4),
              Text(
                'ID: NL-2026-0892', 
                style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5), 
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFA7F3D0)),
                ),
                child: const Text(
                  'KUB Mina Makmur', 
                  style: TextStyle(color: Color(0xFF047857), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Digital KUB Member Card
        Container(
          height: 210,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0F172A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withOpacity(0.35),
                blurRadius: 15,
                offset: const Offset(0, 8),
              )
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.12),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Icon(
                  Icons.sailing_rounded,
                  size: 150,
                  color: Colors.white.withOpacity(0.04),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'KARTU ANGGOTA NELAYAN',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              'KUB MINA MAKMUR',
                              style: TextStyle(
                                color: const Color(0xFF38BDF8),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.anchor_rounded,
                          color: Color(0xFF38BDF8),
                          size: 26,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 28,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFCD34D), Color(0xFFF59E0B)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white24, width: 0.5),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.wifi, color: Colors.white60, size: 16),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'BUDI NELAYAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'ID: NL-2026-0892',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 11,
                                fontFamily: GoogleFonts.shareTechMono().fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 70,
                                height: 18,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(12, (index) {
                                    return Container(
                                      width: index % 3 == 0 ? 3.0 : 1.5,
                                      color: Colors.black,
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'VERIFIED',
                                style: TextStyle(
                                  color: Color(0xFF34D399),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Info List
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), 
            side: BorderSide(color: Colors.grey.shade100),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.directions_boat_rounded, color: Color(0xFF0EA5E9)),
                title: const Text('Jenis Perahu', style: TextStyle(fontSize: 12, color: Colors.grey)),
                subtitle: const Text('Kapal Motor Kecil (< 5 GT)', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontWeight: FontWeight.bold)),
              ),
              Divider(height: 1, color: Colors.grey.shade100),
              ListTile(
                leading: const Icon(Icons.phishing_rounded, color: Color(0xFF0EA5E9)),
                title: const Text('Alat Tangkap', style: TextStyle(fontSize: 12, color: Colors.grey)),
                subtitle: const Text('Jaring Insang (Gillnet)', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        // Logout Button
        Card(
          elevation: 0,
          color: const Color(0xFFFEF2F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFFEE2E2)),
          ),
          child: ListTile(
            onTap: onLogout,
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text('Keluar dari Akun', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
