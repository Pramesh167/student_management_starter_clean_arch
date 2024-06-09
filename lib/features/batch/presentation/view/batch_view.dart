import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<BatchView> createState() => _AddBatchViewState();
}

class _AddBatchViewState extends ConsumerState<BatchView> {
  final _batchNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var batchState = ref.watch(batchViewModelProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Batch'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _batchNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Batch Name',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add batch adding logic here
                },
                child: const Text('Add Batch'),
              ),
              const SizedBox(height: 16),
              const Text(
                'List of Batches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add logic to display list of batches here
            ],
          ),
        ),
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
          currentIndex: 2, // Update this index according to the selected item
          onTap: (index) {
            // Handle navigation logic here
          },
        ),
      ),
    );
  }
}
