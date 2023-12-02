import 'package:dio/dio.dart';
import 'package:test_second_flutter/features/core/resources/data_state.dart';
import 'package:test_second_flutter/features/home_feature/data/data_source/remote/api_provider.dart';
import 'package:test_second_flutter/features/home_feature/data/model/post_model.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';
import 'package:test_second_flutter/features/home_feature/domain/repositories_abstract/post_repository_abstract.dart';

class PostRepositoryImplementation extends PostRepositoryAbstract{

  PostRepositoryImplementation(this.apiProvider);
  ApiProvider apiProvider;

  @override
  Future<DataState<List<PostEntity>>> fetchPostData() async {
    try {
      Response response = await apiProvider.fetchPosts();
      if (response.statusCode == 200) {
        var json = response.data;
        List<PostModel> postDataModel = [];

        if (json != null) {
          json.forEach((v) {
            postDataModel.add(PostModel.fromJson(v));
          });
        }
        List<PostEntity> postDataEntity = postDataModel;
        return DataSuccess(postDataEntity);
      } else {
        return const DataFailed('Something went wrong...try again');
      }
    }catch(e) {
      return const DataFailed('please check your connection');
    }
  }
}