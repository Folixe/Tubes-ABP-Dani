import 'package:flutter/material.dart';
import '../../models/catch_record.dart';
import '../../widgets/input_catch_modal.dart';
import 'home_tab.dart';
import 'chart_tab.dart';
import 'chat_tab.dart';
import 'profile_tab.dart';

class MainAppScreen extends StatefulWidget {
  final VoidCallback onLogout;
  const MainAppScreen({super.key, required this.onLogout});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  
  // Dummy Data State
  List<CatchRecord> catchData = [
    CatchRecord(id: '1', type: 'Tongkol', weight: 25, price: 500000, date: DateTime.now()),
    CatchRecord(id: '2', type: 'Udang', weight: 12, price: 1200000, date: DateTime.now().subtract(const Duration(days: 1))),
    CatchRecord(id: '3', type: 'Cumi', weight: 18, price: 900000, date: DateTime.now().subtract(const Duration(days: 2))),
  ];

  void _addCatch(CatchRecord record) {
    setState(() {
      catchData.insert(0, record);
    });
  }

  void _showInputModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InputCatchModal(onSave: _addCatch),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeTab(catchData: catchData, onOpenInput: () => _showInputModal(context)),
      ChartTab(catchData: catchData),
      const ChatTab(),
      ProfileTab(onLogout: widget.onLogout),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0EA5E9), Color(0xFF0369A1)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.sailing, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            const Text(
              'SITANGKAP', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1E293B)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded, color: Colors.grey.shade700), 
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      floatingActionButton: Transform.rotate(
        angle: 45 * 3.1415926535 / 180, // Rotate by 45 degrees for diamond shape
        child: Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)], // Vibrant royal blue
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () => _showInputModal(context),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Transform.rotate(
              angle: -45 * 3.1415926535 / 180, // Rotate back so icon is upright
              child: const Icon(
                Icons.assignment_add, // Document with a plus icon
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Tab 1: Beranda (Home)
              IconButton(
                icon: Icon(
                  _currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
                  color: _currentIndex == 0 ? const Color(0xFF1D4ED8) : Colors.grey.shade400,
                  size: 26,
                ),
                onPressed: () => setState(() => _currentIndex = 0),
              ),
              // Tab 2: Statistik (Grafik)
              IconButton(
                icon: Icon(
                  _currentIndex == 1 ? Icons.analytics_rounded : Icons.analytics_outlined,
                  color: _currentIndex == 1 ? const Color(0xFF1D4ED8) : Colors.grey.shade400,
                  size: 26,
                ),
                onPressed: () => setState(() => _currentIndex = 1),
              ),
              const SizedBox(width: 48), // Spacer for center diamond FAB
              // Tab 3: Pesan/Forum
              IconButton(
                icon: Icon(
                  _currentIndex == 2 ? Icons.forum_rounded : Icons.forum_outlined,
                  color: _currentIndex == 2 ? const Color(0xFF1D4ED8) : Colors.grey.shade400,
                  size: 26,
                ),
                onPressed: () => setState(() => _currentIndex = 2),
              ),
              // Tab 4: Profil
              IconButton(
                icon: Icon(
                  _currentIndex == 3 ? Icons.person_rounded : Icons.person_outline_rounded,
                  color: _currentIndex == 3 ? const Color(0xFF1D4ED8) : Colors.grey.shade400,
                  size: 26,
                ),
                onPressed: () => setState(() => _currentIndex = 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
