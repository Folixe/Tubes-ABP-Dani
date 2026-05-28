import 'package:flutter/material.dart';
import '../../models/catch_record.dart';

class ChartTab extends StatefulWidget {
  final List<CatchRecord> catchData;
  const ChartTab({super.key, required this.catchData});

  @override
  State<ChartTab> createState() => _ChartTabState();
}

class _ChartTabState extends State<ChartTab> {
  String period = 'month'; // month or year

  @override
  Widget build(BuildContext context) {
    // Mock Chart Data for visualization
    List<double> barValues = period == 'month' 
        ? [10, 25, 15, 30, 20, 45, 12] // Daily mockup
        : [120, 150, 90, 210, 180, 250]; // Monthly mockup
    
    List<String> barLabels = period == 'month'
        ? ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min']
        : ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun'];

    double maxVal = barValues.reduce((curr, next) => curr > next ? curr : next);

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        // Toggle Period Tab Button
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => period = 'month'),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: period == 'month' ? const Color(0xFF0EA5E9) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: period == 'month'
                          ? [BoxShadow(color: const Color(0xFF0EA5E9).withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        'Bulanan', 
                        style: TextStyle(
                          color: period == 'month' ? Colors.white : Colors.grey.shade600, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => period = 'year'),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: period == 'year' ? const Color(0xFF0EA5E9) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: period == 'year'
                          ? [BoxShadow(color: const Color(0xFF0EA5E9).withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        'Tahunan', 
                        style: TextStyle(
                          color: period == 'year' ? Colors.white : Colors.grey.shade600, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Custom Simple Bar Chart UI (Since we can't use external libraries)
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 15,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    period == 'month' ? 'Tangkapan Mingguan' : 'Tangkapan Bulanan', 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F9FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Kg', 
                      style: TextStyle(color: Color(0xFF0EA5E9), fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(barValues.length, (index) {
                    double heightRatio = barValues[index] / maxVal;
                    if (heightRatio.isNaN || heightRatio.isInfinite) {
                      heightRatio = 0.1;
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          barValues[index].toStringAsFixed(0),
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF0EA5E9)),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: period == 'month' ? 24 : 32,
                          height: 150 * heightRatio,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0EA5E9).withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          barLabels[index], 
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.w600),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
