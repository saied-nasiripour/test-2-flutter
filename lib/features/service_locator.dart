import 'package:get_it/get_it.dart';
import 'package:test_second_flutter/features/home_feature/data/data_source/remote/api_provider.dart';
import 'package:test_second_flutter/features/home_feature/data/repositories_implementation/post_repository_implementation.dart';
import 'package:test_second_flutter/features/home_feature/domain/repositories_abstract/post_repository_abstract.dart';
import 'package:test_second_flutter/features/home_feature/domain/use_cases/post_usecase.dart';
import 'package:test_second_flutter/features/home_feature/presentation/bloc/home_bloc.dart';



GetIt serviceLocator = GetIt.instance;


setup() async{
  serviceLocator.registerSingleton<ApiProvider>(ApiProvider());

  serviceLocator.registerSingleton<PostRepositoryAbstract>(PostRepositoryImplementation(serviceLocator()));

  serviceLocator.registerSingleton<PostUseCase>(PostUseCase(serviceLocator()));

  serviceLocator.registerSingleton<HomeBloc>(HomeBloc(serviceLocator()));
}