import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  SignUpRequestBody({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return _$SignUpRequestBodyToJson(this);
  }

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestBodyFromJson(json);
  }
}
