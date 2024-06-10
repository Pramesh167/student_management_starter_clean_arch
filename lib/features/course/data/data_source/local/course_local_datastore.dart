import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/course/data/model/course_hive_model.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';


final courseLocalDataSourceProvider = Provider(
  (ref) => CourseLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    courseHiveModel: ref.read(courseHiveModelProvider),
  ),
);

class CourseLocalDataSource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalDataSource(
      {required this.hiveService, required this.courseHiveModel});

//add course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      //convert entity to hive obj
      final hiveCourse = courseHiveModel.fromEntity(course);
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
  //delete course
  Future<Either<Failure, bool>> deleteCourse(CourseEntity course) async {
    try {
      //convert entity to hive obj
      final hiveCourse = courseHiveModel.fromEntity(course);
      await hiveService.deleteCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  //get all coursess
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final hiveCourses = await hiveService.getAllCourses();
      final courses = courseHiveModel.toEntityList(hiveCourses);
      return Right(courses);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
