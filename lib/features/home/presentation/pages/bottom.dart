import 'package:flutter/material.dart';
import 'package:qorum/features/home/presentation/pages/clippath_screen.dart';

class ModernDashboard extends StatefulWidget {
  const ModernDashboard({super.key});

  @override
  State<ModernDashboard> createState() => _ModernDashboardState();
}

class _ModernDashboardState extends State<ModernDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // ১. বডি কন্টেন্ট
      body: Center(child: Text("Page Index: $_currentIndex")),

      // ২. মাঝখানের বড় প্লাস বাটন (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClippathScreen()),
          );
        },
        backgroundColor: const Color(0xFF32A47F),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      // ৩. FAB কে বটম বারের ঠিক মাঝখানে সেট করা
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ৪. কাস্টম বটম বার
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // এটি বাটনটির জন্য খাাঁজ তৈরি করে
        notchMargin: 8.0, // বাটন এবং বারের মাঝখানের গ্যাপ
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // বাম পাশের আইটেমগুলো
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  navItem(Icons.grid_view_rounded, "Dashboard", 0),
                  navItem(Icons.business_rounded, "Company", 1),
                ],
              ),
              // ডান পাশের আইটেমগুলো
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  navItem(Icons.bar_chart_rounded, "Report", 2),
                  navItem(Icons.settings_rounded, "Settings", 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // বটম নেভিগেশন আইটেম উইজেট
  Widget navItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF32A47F) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF32A47F) : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}