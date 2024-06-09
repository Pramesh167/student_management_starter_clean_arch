import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final List<CourseEntity> lstCourse;
  final bool isLoading;
  final String? error;

  BatchState({
    required this.lstCourse,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(lstCourse: [], isLoading: false, error: null);
  }

  BatchState copyWith({
    List<CourseEntity>? lstBatches,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      lstCourse: lstBatches ?? lstCourse,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
