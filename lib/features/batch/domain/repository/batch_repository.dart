import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/repository/batch_local_repository.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  return ref.read(batchLocalRepository);
});

abstract class IBatchRepository {
  Future<Either<Failure, bool>> addBatch(CourseEntity batch);
  Future<Either<Failure, List<CourseEntity>>> getAllBatches();
}
