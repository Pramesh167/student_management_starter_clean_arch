import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final List<BatchEntity> lstBatch;
  final bool isLoading;
  final String? error;

  BatchState({
    required this.lstBatch,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(lstBatch: [], isLoading: false, error: null);
  }

  BatchState copyWith({
    List<BatchEntity>? lstBatches,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      lstBatch: lstBatches ?? lstBatch,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
