import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_second_flutter/features/home_feature/presentation/bloc/home_bloc.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const LoadPageEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Pagination',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, PaginationState>(
          builder: (context, state) {
            if (state is PaginationLoadingState) {
              if (kDebugMode) {
                print("build Method : PaginationLoadingState");
              }
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.purpleAccent, size: 50),
              );
            }
            else if (state is PaginationLoadedState) {
              final bloc = BlocProvider.of<HomeBloc>(context);
              if (kDebugMode) {
                print("build Method : PaginationLoadedState");
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: bloc.items.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (bloc.isLastPage == false){
                          if (index == bloc.items.length - bloc.nextPageTrigger) {
                            bloc.add(CheckIfNeedMoreDataEvent(index: index));
                          }
                        }
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: ListTile(
                            title: Text(
                                "${index + 1}. ${bloc.items[index].title}"),
                            subtitle: Text(
                                "Price: ${bloc.items[index].price} \$"),
                          ),
                        );
                      },
                    ),
                  ),
                  if (bloc.isLastPage == true)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: Colors.amber,
                      child: const Center(
                        child: Text('You have fetched all of the content'),
                      ),
                    ),
                ],
              );
            }
            else if (state is PaginationErrorState) {
              if (kDebugMode) {
                print("build Method : PaginationErrorState");
              }
              return Text("Server Error");
            }
            else {
              if (kDebugMode) {
                print("build Method : Empty SizedBox");
              }
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}