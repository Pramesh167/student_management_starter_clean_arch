import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/batch_repository.dart';

final batchUseCaseProvider = Provider<BatchUsecase>((ref) => BatchUsecase(
      batchRepository: ref.read(batchRepositoryProvider),
    ));

class BatchUsecase {
  final IBatchRepository batchRepository;
  BatchUsecase({required this.batchRepository});

  //for adding batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRepository.addBatch(batch);
  }

  //for getting all batch
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRepository.getAllBatches();

  }
  //for deleting batch
  Future<Either<Failure, bool>> deleteBatch(BatchEntity batch) {
    return batchRepository.deleteBatch(batch);
  }
}
