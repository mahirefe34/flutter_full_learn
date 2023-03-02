import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: ''));
  });
  test('Test', () async {
    final response = await dio.post('https://reqres.in/api/login',
        data: {"email": "eve.holt@reqres.in", "password": "cityslicka"});

    print(response);
  });
}
