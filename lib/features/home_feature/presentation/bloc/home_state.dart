part of 'home_bloc.dart';


class HomeState {
  final HomeStatus homeStatus;

  const HomeState({required this.homeStatus});

  HomeState check({HomeStatus? newHomeStatus}) {
    return HomeState(
      homeStatus: newHomeStatus ?? homeStatus,
    );
  }

}
