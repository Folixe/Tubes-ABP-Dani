import 'package:flutter/material.dart';
import '../../models/catch_record.dart';

class HomeTab extends StatelessWidget {
  final List<CatchRecord> catchData;
  final VoidCallback onOpenInput;

  const HomeTab({super.key, required this.catchData, required this.onOpenInput});

  @override
  Widget build(BuildContext context) {
    double totalWeight = catchData.fold(0, (sum, item) => sum + item.weight);
    final int listLength = catchData.isEmpty ? 1 : catchData.length;

    return ListView.builder(
      padding: const EdgeInsets.all(18),
      itemCount: 2 + listLength,
      itemBuilder: (context, index) {
        if (index == 0) {
          // Greeting Card with Gradient Wave
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0EA5E9).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang,'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                      ),
                    ),
                            const SizedBox(height: 4),
                            const Text(
                              'Budi Nelayan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.sailing_rounded, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Tangkapan Bulan Ini',
                                style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${totalWeight.toStringAsFixed(1)} Kg',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.analytics, color: Color(0xFF0EA5E9), size: 22),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 28),
            ],
          );
        } else if (index == 1) {
          // Header "RIWAYAT TERAKHIR"
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    'RIWAYAT TERAKHIR', 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF475569), letterSpacing: 1.2, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 14),
            ],
          );
        } else {
          // Catch items or Empty Placeholder
          if (catchData.isEmpty) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.set_meal_outlined, size: 50, color: Colors.grey.shade300),
                  const SizedBox(height: 12),
                  Text(
                    'Belum Ada Catatan Tangkapan',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tekan tombol tambah di bawah untuk mulai mencatat.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
            );
          }

          final CatchRecord record = catchData[index - 2];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.015),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE0F2FE), Color(0xFFBAE6FD)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.set_meal_rounded, color: Color(0xFF0EA5E9), size: 24),
              ),
              title: Text(
                record.type, 
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B), fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${record.date.day}/${record.date.month}/${record.date.year}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${record.weight} Kg', 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF0EA5E9),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Rp ${(record.price / 1000).toStringAsFixed(0)}k', 
                    style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
