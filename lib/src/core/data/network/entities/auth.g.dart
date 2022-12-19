// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthNetworkDto> _$authNetworkDtoSerializer =
    new _$AuthNetworkDtoSerializer();

class _$AuthNetworkDtoSerializer
    implements StructuredSerializer<AuthNetworkDto> {
  @override
  final Iterable<Type> types = const [AuthNetworkDto, _$AuthNetworkDto];
  @override
  final String wireName = 'AuthNetworkDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthNetworkDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'access_token',
      serializers.serialize(object.access_token,
          specifiedType: const FullType(String)),
      'token_type',
      serializers.serialize(object.token_type,
          specifiedType: const FullType(String)),
      'expires_in',
      serializers.serialize(object.expires_in,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  AuthNetworkDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthNetworkDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.access_token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token_type':
          result.token_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'expires_in':
          result.expires_in = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthNetworkDto extends AuthNetworkDto {
  @override
  final String access_token;
  @override
  final String token_type;
  @override
  final int expires_in;

  factory _$AuthNetworkDto([void Function(AuthNetworkDtoBuilder)? updates]) =>
      (new AuthNetworkDtoBuilder()..update(updates))._build();

  _$AuthNetworkDto._(
      {required this.access_token,
      required this.token_type,
      required this.expires_in})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        access_token, r'AuthNetworkDto', 'access_token');
    BuiltValueNullFieldError.checkNotNull(
        token_type, r'AuthNetworkDto', 'token_type');
    BuiltValueNullFieldError.checkNotNull(
        expires_in, r'AuthNetworkDto', 'expires_in');
  }

  @override
  AuthNetworkDto rebuild(void Function(AuthNetworkDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthNetworkDtoBuilder toBuilder() =>
      new AuthNetworkDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthNetworkDto &&
        access_token == other.access_token &&
        token_type == other.token_type &&
        expires_in == other.expires_in;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, access_token.hashCode), token_type.hashCode),
        expires_in.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthNetworkDto')
          ..add('access_token', access_token)
          ..add('token_type', token_type)
          ..add('expires_in', expires_in))
        .toString();
  }
}

class AuthNetworkDtoBuilder
    implements Builder<AuthNetworkDto, AuthNetworkDtoBuilder> {
  _$AuthNetworkDto? _$v;

  String? _access_token;
  String? get access_token => _$this._access_token;
  set access_token(String? access_token) => _$this._access_token = access_token;

  String? _token_type;
  String? get token_type => _$this._token_type;
  set token_type(String? token_type) => _$this._token_type = token_type;

  int? _expires_in;
  int? get expires_in => _$this._expires_in;
  set expires_in(int? expires_in) => _$this._expires_in = expires_in;

  AuthNetworkDtoBuilder();

  AuthNetworkDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _access_token = $v.access_token;
      _token_type = $v.token_type;
      _expires_in = $v.expires_in;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthNetworkDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthNetworkDto;
  }

  @override
  void update(void Function(AuthNetworkDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthNetworkDto build() => _build();

  _$AuthNetworkDto _build() {
    final _$result = _$v ??
        new _$AuthNetworkDto._(
            access_token: BuiltValueNullFieldError.checkNotNull(
                access_token, r'AuthNetworkDto', 'access_token'),
            token_type: BuiltValueNullFieldError.checkNotNull(
                token_type, r'AuthNetworkDto', 'token_type'),
            expires_in: BuiltValueNullFieldError.checkNotNull(
                expires_in, r'AuthNetworkDto', 'expires_in'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
