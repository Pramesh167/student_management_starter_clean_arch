import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

class CourseState {
  final List<CourseEntity> lstCourse;
  final bool isLoading;
  final String? error;

  CourseState({
    required this.lstCourse,
    required this.isLoading,
    this.error,
  });

  factory CourseState.initial() {
    return CourseState(lstCourse: [], isLoading: false, error: null);
  }

  CourseState copyWith({
    List<CourseEntity>? lstCourses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      lstCourse: lstCourses ?? lstCourse,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
