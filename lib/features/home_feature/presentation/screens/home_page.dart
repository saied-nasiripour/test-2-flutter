import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';
import 'package:test_second_flutter/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:test_second_flutter/features/home_feature/presentation/bloc/post_status.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = [];
  var isFirstTry = true;
  bool hasMore = true;
  final limit = 14;
  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (isFirstTry) {
      fetch();
    }
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }  
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _loadMoreData() {
    BlocProvider.of<HomeBloc>(context).add(LoadPostEvent());
  }

  Future fetch() async {
    if (hasMore) {
      BlocProvider.of<HomeBloc>(context).add(LoadPostEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (BuildContext context, HomeState state) {
                    if (state.homeStatus is HomeLoadingStatus) {
                      if (isFirstTry) {
                        return LoadingAnimationWidget.inkDrop(
                            color: Colors.purpleAccent, size: 50);
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: controller,
                          itemCount: items.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < items.length) {
                              return ListTile(
                                title: Text(
                                  "$index : ${items[index].title}",
                                  style: const TextStyle(fontSize: 23),
                                ),
                              );
                            } else {
                              if (state.homeStatus is HomeLoadingStatus) {
                                return Center(
                                  child: hasMore
                                      ? LoadingAnimationWidget.inkDrop(
                                      color: Colors.purpleAccent, size: 30)
                                      : const SizedBox(),
                                );
                              }
                            }
                          },
                        );
                      }
                    }
                    if (state.homeStatus is HomeCompletedStatus) {
                      isFirstTry = false;
                      final HomeCompletedStatus homeCompletedStatus = state.homeStatus as HomeCompletedStatus;
                      items.addAll(homeCompletedStatus.postDataEntity);
                      if (kDebugMode) {
                        print(items.length);
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: controller,
                        itemCount: items.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (homeCompletedStatus.postDataEntity.length < limit) {
                            hasMore = false;
                          }
                          if (index < items.length) {
                            return ListTile(
                              title: Text(
                                "$index : ${items[index].title}",
                                style: const TextStyle(fontSize: 23),
                              ),
                            );
                          } else {
                            if (state.homeStatus is HomeLoadingStatus) {
                              return Center(
                                child: hasMore
                                    ? LoadingAnimationWidget.inkDrop(
                                    color: Colors.purpleAccent, size: 30)
                                    : const SizedBox(),
                              );
                            }
                          }
                        },
                      );
                    }
                    if (state.homeStatus is HomeErrorStatus) {
                      return const Center(
                        child: Text('error'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
