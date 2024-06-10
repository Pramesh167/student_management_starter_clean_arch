import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/usecases/course_usecase.dart';
import 'package:student_management_starter/features/course/presentation/state/course_state.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>((ref) {
  return CourseViewModel(ref.read(courseUseCaseProvider));
});

class CourseViewModel extends StateNotifier<CourseState> {
  CourseViewModel(this.courseUseCase) : super(CourseState.initial()) {
    getAllCourses();
  }

  final CourseUsecase courseUseCase;

  addCourse(CourseEntity course) async {
    //showin progresbar
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.addCourse(course);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: "course added sucessfully");
    });
    getAllCourses();
  }
  //delete course
  deleteCourse(CourseEntity course) async {
    //showin progresbar
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.deleteCourse(course);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: "course deleted sucessfully");
    });
    getAllCourses();
  }

  //for getting all courses
  getAllCourses() async {
    //to show progressbar
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.getAllCourses();

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      //show error message
    }, (r) {
      state = state.copyWith(isLoading: false, lstCourses: r, error: null);
      //show success message
    });
  }
}
