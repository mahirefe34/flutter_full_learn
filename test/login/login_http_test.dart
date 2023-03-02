import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  setUp(() {});
  test('Test', () async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    );

    print(response.body);
  });
}
