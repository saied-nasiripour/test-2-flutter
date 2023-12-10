part of 'home_bloc.dart';

abstract class PaginationState{}

class PaginationInitialState extends PaginationState {
  PaginationInitialState();
}

class PaginationLoadingState extends PaginationState {}

class PaginationLoadedState extends PaginationState {}

class PaginationErrorState extends PaginationState {}