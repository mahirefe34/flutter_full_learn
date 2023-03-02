import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login_error_model.dart';

abstract class ILoginService {
  final INetworkManager<LoginErrorModel> networkManager;

  ILoginService(this.networkManager);

  Future<IResponseModel<TokenModel?, LoginErrorModel?>> login(LoginModel model);

  final String _loginPath = '/login';
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, LoginErrorModel?>> login(
      LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        parseModel: TokenModel(), method: RequestType.POST, data: model);
  }
}
