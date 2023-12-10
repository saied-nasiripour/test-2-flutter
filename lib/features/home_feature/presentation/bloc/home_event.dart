part of 'home_bloc.dart';

abstract class PaginationEvent{
  const PaginationEvent();
}

class LoadPageEvent extends PaginationEvent {
  const LoadPageEvent();
}

class CheckIfNeedMoreDataEvent extends PaginationEvent {
  final int index;
  const CheckIfNeedMoreDataEvent({required this.index});

}