
import 'package:test_second_flutter/features/core/resources/data_state.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';

abstract class PostRepositoryAbstract {
  Future<DataState<List<PostEntity>>> fetchPostData();
}