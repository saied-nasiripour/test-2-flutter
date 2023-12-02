import 'package:flutter/material.dart';
import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';

@immutable
abstract class HomeStatus {}

class HomeLoadingStatus extends HomeStatus {}

class HomeCompletedStatus extends HomeStatus {
  final List<PostEntity> postDataEntity;
  HomeCompletedStatus(this.postDataEntity);
}

class HomeErrorStatus extends HomeStatus {
  final String message;
  HomeErrorStatus(this.message);
}