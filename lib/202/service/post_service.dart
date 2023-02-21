import 'dart:io';

import 'package:dio/dio.dart';

import 'post_model.dart';

class PostService {
  final Dio _networkManager;
  PostService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

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

  Future<bool> addItemToService(PostModel postModel) async {
    final responce = await _networkManager.post(
      _PostServicePaths.posts.name,
      data: postModel,
    );

    return responce.statusCode == HttpStatus.created;
  }

  Future<bool> updateItemToService(PostModel postModel, int id) async {
    final responce = await _networkManager.put(
      '${_PostServicePaths.posts.name}/$id',
      data: postModel,
    );

    return responce.statusCode == HttpStatus.ok;
  }

  Future<bool> deleteItemToService(int id) async {
    final responce = await _networkManager.put(
      '${_PostServicePaths.posts.name}/$id',
    );

    return responce.statusCode == HttpStatus.ok;
  }
}

enum _PostServicePaths { posts, comments }
