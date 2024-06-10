import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<BatchView> createState() => _AddBatchViewState();
}

class _AddBatchViewState extends ConsumerState<BatchView> {
  final batchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Add Batch',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Brand Bold',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: batchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Batch Name',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(batchViewModelProvider.notifier).addBatch(
                      BatchEntity(batchName: batchController.text));
                },
                child: const Text('Add Batch'),
              ),
            ),
            //Display List of Batches
            if (batchState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (batchState.error != null) ...{
              Text(batchState.error.toString()),
            } else if (batchState.lstBatch.isEmpty) ...{
              const Center(
                child: Text('No Batches'),
              )
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: batchState.lstBatch.length,
                  itemBuilder: (context, index) {
                    var batch = batchState.lstBatch[index];
                    return ListTile(
                      title: Text(batch.batchName),
                      subtitle: Text(batch.batchId ?? ''),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete), onPressed: () {
                            ref.read(batchViewModelProvider.notifier).deleteBatch(batch);
                          }),
                    );
                  },
                ),
              )
            }
          ],
        ),
      ),
    );
    //
  }
}
