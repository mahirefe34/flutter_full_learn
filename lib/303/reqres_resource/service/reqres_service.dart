import 'dart:io';

import 'package:dio/dio.dart';

import '../model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqresPath { resource }

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final responce = await dio.get('/${_ReqresPath.resource.name}');
    if (responce.statusCode == HttpStatus.ok) {
      final jsonBody = responce.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
