import 'package:flutter/material.dart';
import '../../widgets/custom_alert.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        // Tab Header
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF0EA5E9),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'FORUM & INFO CUACA', 
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF475569), letterSpacing: 1.2, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Custom Alert 1: Prakiraan Cuaca (Warning Light)
        const CustomAlert(
          variant: AlertVariant.warning,
          appearance: AlertAppearance.light,
          close: true,
          icon: Icon(Icons.wb_sunny_rounded),
          title: 'Prakiraan Cuaca Hari Ini',
          description: 'Gelombang laut 1.2m - Angin terpantau bersahabat. Kondisi aman dan sangat direkomendasikan untuk berlayar mencari ikan.',
        ),
        const SizedBox(height: 12),

        // Custom Alert 2: GPS Telemetry (Success Light)
        const CustomAlert(
          variant: AlertVariant.success,
          appearance: AlertAppearance.light,
          close: true,
          icon: Icon(Icons.gps_fixed_rounded),
          title: 'GPS Kapal Terkoneksi',
          description: 'Sistem navigasi maritim aktif. Pemancar sinyal darurat (SOS) KUB Mina Makmur sedang melacak perjalanan melaut Anda.',
        ),
        const SizedBox(height: 20),
        
        // Fisherman Forum Threads
        _buildForumCard(
          title: 'Tips Mendeteksi Gerombolan Ikan Tongkol',
          sender: 'Pak Joko (Nelayan KUB)',
          time: '10 menit lalu',
          replies: 14,
          icon: Icons.lightbulb_outline_rounded,
          iconColor: Colors.amber,
        ),
        _buildForumCard(
          title: 'Harga Pasaran Udang Windu per Kg',
          sender: 'Bu Retno (Pengepul KUB)',
          time: '1 jam lalu',
          replies: 28,
          icon: Icons.payments_outlined,
          iconColor: Colors.green,
        ),
        _buildForumCard(
          title: 'Perawatan Mesin Tempel Kapal Motor',
          sender: 'Budi Nelayan',
          time: '3 jam lalu',
          replies: 8,
          icon: Icons.build_circle_outlined,
          iconColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildForumCard({
    required String title,
    required String sender,
    required String time,
    required int replies,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B), fontSize: 15),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      sender,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 8),
                    Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              const Icon(Icons.mode_comment_outlined, color: Colors.grey, size: 16),
              const SizedBox(height: 4),
              Text(
                '$replies',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
