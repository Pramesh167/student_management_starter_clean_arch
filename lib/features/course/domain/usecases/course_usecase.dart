import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/course_repository.dart';

final courseUseCaseProvider = Provider<CourseUsecase>((ref) => CourseUsecase(
      courseRepository: ref.read(courseRepositoryProvider),
    ));

class CourseUsecase {
  final ICourseRepository courseRepository;
  CourseUsecase({required this.courseRepository});

  //for adding course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }

  //for getting all course
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }
}
