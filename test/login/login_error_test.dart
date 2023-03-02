import 'package:flutter_full_learn/404/bloc/feature/login/model/login_error_model.dart';
import 'package:flutter_full_learn/404/bloc/product/model/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager<LoginErrorModel> networkManager;
  setUp(() {
    networkManager = NetworkManager<LoginErrorModel>(
      errorModel: LoginErrorModel(),
      options: BaseOptions(baseUrl: ''),
      isEnableLogger: true,
      isEnableTest: true,
    );
  });
  test('Error Test', () async {
    final response = await networkManager.send<TokenModel, TokenModel>(
      'https://reqres.in/api/login',
      parseModel: TokenModel(),
      data: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
      method: RequestType.POST,
    );

    print(response);
  });
}
