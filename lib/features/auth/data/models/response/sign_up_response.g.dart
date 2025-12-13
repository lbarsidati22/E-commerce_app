// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
};
