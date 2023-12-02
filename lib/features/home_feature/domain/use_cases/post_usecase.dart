
import 'package:test_second_flutter/features/core/resources/data_state.dart';
import 'package:test_second_flutter/features/core/use_cases/use_case.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';
import 'package:test_second_flutter/features/home_feature/domain/repositories_abstract/post_repository_abstract.dart';

class PostUseCase extends UseCase<DataState<List<PostEntity>>>{
  final PostRepositoryAbstract postRepository;
  PostUseCase(this.postRepository);

  // callable class
  @override
  Future<DataState<List<PostEntity>>> call() {
    return postRepository.fetchPostData();
  }

}