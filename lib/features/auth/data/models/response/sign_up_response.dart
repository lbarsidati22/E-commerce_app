import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "error")
  final String? error;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignUpResponse({this.message, this.user, this.token, this.error});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseFromJson(json);
  }

  AuthEntity toEntity() {
    return AuthEntity(name: user?.name, email: user?.email, token: token);
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  UserDto({this.name, this.email, this.role});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  AuthEntity toEntity() {
    return AuthEntity(name: name, email: email);
  }
}
