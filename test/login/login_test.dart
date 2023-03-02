import 'package:flutter_full_learn/404/bloc/feature/login/model/login_error_model.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    loginService = LoginService(NetworkManager<LoginErrorModel>(
        errorModel: LoginErrorModel(),
        isEnableTest: true,
        isEnableLogger: true,
        options: BaseOptions(baseUrl: 'https://reqres.in/api')));
  });
  test('Login Test - eve.holt@reqres.in & cityslicka', () async {
    final response = await loginService
        .login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
    print(response.data?.token);
    //expect(response, isNotNull);
  });
}
