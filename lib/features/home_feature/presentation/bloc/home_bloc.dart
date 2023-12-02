import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_second_flutter/features/core/resources/data_state.dart';
import 'package:test_second_flutter/features/home_feature/domain/use_cases/post_usecase.dart';
import 'package:test_second_flutter/features/home_feature/presentation/bloc/post_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final PostUseCase postUseCase;
  HomeBloc(this.postUseCase) : super(HomeState(homeStatus: HomeLoadingStatus())){
    on<LoadPostEvent>((event, emit) async{
      emit(state.check(newHomeStatus: HomeLoadingStatus()));
      DataState dataState = await postUseCase();
      if (dataState is DataSuccess) {
        emit(state.check(newHomeStatus: HomeCompletedStatus(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.check(newHomeStatus: HomeErrorStatus(dataState.error!)));
      }
    });
  }
}
