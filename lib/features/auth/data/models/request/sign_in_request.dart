import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequestBody {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  SignInRequestBody({this.email, this.password});

  factory SignInRequestBody.fromJson(Map<String, dynamic> json) {
    return _$SignInRequestBodyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInRequestBodyToJson(this);
  }
}
