import 'package:vexana/vexana.dart';

import '../../feature/login/model/login_error_model.dart';

class ReqresNetworkManager extends NetworkManager<LoginErrorModel> {
  ReqresNetworkManager()
      : super(
          errorModel: LoginErrorModel(),
          //isEnableTest: true,
          //isEnableLogger: true,
          options: BaseOptions(baseUrl: 'https://reqres.in/api'),
        );
}
