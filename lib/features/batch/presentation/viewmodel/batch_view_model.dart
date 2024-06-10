import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/usecases/batch_usecase.dart';
import 'package:student_management_starter/features/batch/presentation/state/batch_state.dart';

final batchViewModelProvider =
    StateNotifierProvider<BatchViewModel, BatchState>((ref) {
  return BatchViewModel(ref.read(batchUseCaseProvider));
});

class BatchViewModel extends StateNotifier<BatchState> {
  BatchViewModel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

  final BatchUsecase batchUseCase;

  addBatch(BatchEntity batch) async {
    //showin progresbar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: "batch added sucessfully");
    });
    getAllBatches();
  }

  //for getting all batches
  getAllBatches() async {
    //to show progressbar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      //show error message
    }, (r) {
      state = state.copyWith(isLoading: false, lstBatches: r, error: null);
      //show success message
    });
  }
}
