import 'package:hive_flutter/adapters.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';




@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String? courseId;
  @HiveField(1)
  final String courseName;

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }):courseId=courseId?? const Uuid().v4();
  CourseHiveModel.empty()
      : courseId = '',
        courseName = '';
}
