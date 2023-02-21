import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';

import 'post_model.dart';

abstract class IPostService {
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> updateItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fetchRelationedCommentsWithPostId(int postId);
}

class PostServiceAdvance implements IPostService {
  final Dio _networkManager;
  PostServiceAdvance()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    final response = await _networkManager.get(_PostServicePaths.posts.name);
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    final responce = await _networkManager.post(
      _PostServicePaths.posts.name,
      data: postModel,
    );

    return responce.statusCode == HttpStatus.created;
  }

  @override
  Future<bool> updateItemToService(PostModel postModel, int id) async {
    final responce = await _networkManager.put(
      '${_PostServicePaths.posts.name}/$id',
      data: postModel,
    );

    return responce.statusCode == HttpStatus.ok;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    final responce = await _networkManager.put(
      '${_PostServicePaths.posts.name}/$id',
    );

    return responce.statusCode == HttpStatus.ok;
  }

  @override
  Future<List<CommentModel>?> fetchRelationedCommentsWithPostId(
      int postId) async {
    final response = await _networkManager.get(
      _PostServicePaths.comments.name,
      queryParameters: {_CommentQueryPaths.postId.name: postId},
    );
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => CommentModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _CommentQueryPaths { postId }
