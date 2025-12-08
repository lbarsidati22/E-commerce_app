import 'package:Ecommerce/features/auth/data/models/response/sign_up_response.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignInResponse({this.message, this.user, this.token});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInResponseToJson(this);
  }

  AuthEntity toEntity() {
    return AuthEntity(name: user?.name, email: user?.email);
  }
}
