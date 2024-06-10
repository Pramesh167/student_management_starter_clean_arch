import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/presentation/view/batch_view.dart';
import 'package:student_management_starter/features/course/presentation/view/course_view.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    final views = [
      const Center(child: Text('Dashboard')), // Replace with DashboardView
      const CourseView(),
      const BatchView(),
      const Center(child: Text('Profile')), // Replace with ProfileView
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Add your refresh logic here
            },
          ),
          Switch(
            value: true, // Replace with a provider value if needed
            onChanged: (value) {
              // Add your toggle logic here
            },
          ),
        ],
      ),
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Batch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
