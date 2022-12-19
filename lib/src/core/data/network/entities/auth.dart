import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:faneron_mobile/src/core/data/network/entities/serializers.dart';
import 'package:faneron_mobile/src/core/domain/entities.dart';

part 'auth.g.dart';

abstract class AuthNetworkDto implements Built<AuthNetworkDto, AuthNetworkDtoBuilder> {
  String get access_token;

  String get token_type;

  int get expires_in;

  static AuthNetworkDto? fromJson(Map<String, dynamic> json) =>
      serializersAuth.deserializeWith(AuthNetworkDto.serializer, json);

  static Serializer<AuthNetworkDto> get serializer => _$authNetworkDtoSerializer;

  AuthNetworkDto._();

  factory AuthNetworkDto([void Function(AuthNetworkDtoBuilder) updates]) = _$AuthNetworkDto;

  AuthDomain get toDomain => AuthDomain(
        accessToken: access_token,
        tokenType: token_type,
        expiresIn: expires_in,
      );
}
