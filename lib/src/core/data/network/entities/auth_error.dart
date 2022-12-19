import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:faneron_mobile/src/core/data/network/entities/serializers.dart';

part 'auth_error.g.dart';

abstract class AuthErrorNetworkDto
    implements Built<AuthErrorNetworkDto, AuthErrorNetworkDtoBuilder> {
  String get message;
  Map<String, List<String>> get errors;

  static AuthErrorNetworkDto? fromJson(Map<String, dynamic> json) =>
      serializersAuthError.deserializeWith(
          AuthErrorNetworkDto.serializer, json);

  static Serializer<AuthErrorNetworkDto> get serializer =>
      _$authErrorNetworkDtoSerializer;

  AuthErrorNetworkDto._();
  factory AuthErrorNetworkDto(
          [void Function(AuthErrorNetworkDtoBuilder) updates]) =
      _$AuthErrorNetworkDto;
}
