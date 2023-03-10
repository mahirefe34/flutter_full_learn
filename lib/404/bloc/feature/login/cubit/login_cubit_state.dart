// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../product/model/token_model.dart';
import '../model/login_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isComplated;

  const LoginState({
    this.isLoading = false,
    this.model,
    this.tokenModel,
    this.isComplated = false,
  });
  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isComplated,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isComplated: isComplated ?? false,
    );
  }
}
