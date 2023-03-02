import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_error_model.g.dart';

@JsonSerializable()
class LoginErrorModel extends INetworkModel<LoginErrorModel> {
  String? error;

  LoginErrorModel({
    this.error,
  });

  @override
  LoginErrorModel fromJson(Map<String, dynamic> json) =>
      LoginErrorModel.fromJson(json);

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      _$LoginErrorModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginErrorModelToJson(this);

  LoginErrorModel copyWith({
    String? error,
  }) {
    return LoginErrorModel(
      error: error ?? this.error,
    );
  }
}
