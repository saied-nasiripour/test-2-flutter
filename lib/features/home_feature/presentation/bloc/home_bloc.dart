import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:test_second_flutter/features/core/resources/data_state.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';
import 'package:test_second_flutter/features/home_feature/domain/use_cases/post_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<PaginationEvent, PaginationState> {
  bool isLastPage = false;
  bool _isFirstRun = true;
  int pageNumber = 0;
  final int numberOfPostsPerRequest = 11;
  List<PostEntity> items = [];
  final int nextPageTrigger = 3;
  final PostUseCase postUseCase;

  HomeBloc(this.postUseCase)
      : super(PaginationInitialState()) {

    // -------------------------------------------------------------------


    // -------------------------------------------------------------------

    on<LoadPageEvent>((event, emit) async {
      if (_isFirstRun) {
        emit(PaginationLoadingState());
        _isFirstRun = false;
      }
      if (isLastPage == false) {
        try {
          DataState dataState = await postUseCase();

          if (dataState is DataSuccess) {
            if ((dataState.data).length == 0) {
              isLastPage = true;
            }
            items.addAll(dataState.data);
            emit(PaginationLoadedState());
          } else if (dataState is DataFailed) {
            if (kDebugMode) {
              print("error --> ${dataState.error}");
            }
            emit(PaginationErrorState());
          }
        } catch (e) {
          if (kDebugMode) {
            print("error --> $e");
          }
          emit(PaginationErrorState());
        }
      }
    });

    // -------------------------------------------------------------------

    on<CheckIfNeedMoreDataEvent>((event, emit) async {
/*      emit(PaginationLoadingState());*/
      if (isLastPage == false) {
        if (event.index == items.length - nextPageTrigger) {
          add(const LoadPageEvent());
        }
      }
    });

    // -------------------------------------------------------------------

  }
}