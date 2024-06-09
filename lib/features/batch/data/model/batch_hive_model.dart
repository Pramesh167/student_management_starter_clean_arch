import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

final batchHiveModelProvider = Provider(
  (ref) => BatchHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  BatchHiveModel.empty()
      : batchId = '',
        batchName = '';

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: batchId,
        courseName: batchName,
      );

  // Convert Entity to Hive Object
  BatchHiveModel fromEntity(CourseEntity entity) => BatchHiveModel(
        batchId: entity.courseId,
        batchName: entity.courseName,
      );

  // Convert Hive List to Entity List
  List<CourseEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
