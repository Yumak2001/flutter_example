import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth_error.dart';

part 'serializers.g.dart';

@SerializersFor([AuthNetworkDto])
final Serializers serializersAuth = (_$serializersAuth.toBuilder()..addPlugin(StandardJsonPlugin())).build();

@SerializersFor([AuthErrorNetworkDto])
final Serializers serializersAuthError = (_$serializersAuthError.toBuilder()..addPlugin(StandardJsonPlugin())).build();
