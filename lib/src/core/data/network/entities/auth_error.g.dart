// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthErrorNetworkDto> _$authErrorNetworkDtoSerializer =
    new _$AuthErrorNetworkDtoSerializer();

class _$AuthErrorNetworkDtoSerializer
    implements StructuredSerializer<AuthErrorNetworkDto> {
  @override
  final Iterable<Type> types = const [
    AuthErrorNetworkDto,
    _$AuthErrorNetworkDto
  ];
  @override
  final String wireName = 'AuthErrorNetworkDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AuthErrorNetworkDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'errors',
      serializers.serialize(object.errors,
          specifiedType: const FullType(Map, const [
            const FullType(String),
            const FullType(List, const [const FullType(String)])
          ])),
    ];

    return result;
  }

  @override
  AuthErrorNetworkDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthErrorNetworkDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'errors':
          result.errors = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(List, const [const FullType(String)])
              ]))! as Map<String, List<String>>;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthErrorNetworkDto extends AuthErrorNetworkDto {
  @override
  final String message;
  @override
  final Map<String, List<String>> errors;

  factory _$AuthErrorNetworkDto(
          [void Function(AuthErrorNetworkDtoBuilder)? updates]) =>
      (new AuthErrorNetworkDtoBuilder()..update(updates))._build();

  _$AuthErrorNetworkDto._({required this.message, required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'AuthErrorNetworkDto', 'message');
    BuiltValueNullFieldError.checkNotNull(
        errors, r'AuthErrorNetworkDto', 'errors');
  }

  @override
  AuthErrorNetworkDto rebuild(
          void Function(AuthErrorNetworkDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthErrorNetworkDtoBuilder toBuilder() =>
      new AuthErrorNetworkDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthErrorNetworkDto &&
        message == other.message &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthErrorNetworkDto')
          ..add('message', message)
          ..add('errors', errors))
        .toString();
  }
}

class AuthErrorNetworkDtoBuilder
    implements Builder<AuthErrorNetworkDto, AuthErrorNetworkDtoBuilder> {
  _$AuthErrorNetworkDto? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Map<String, List<String>>? _errors;
  Map<String, List<String>>? get errors => _$this._errors;
  set errors(Map<String, List<String>>? errors) => _$this._errors = errors;

  AuthErrorNetworkDtoBuilder();

  AuthErrorNetworkDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _errors = $v.errors;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthErrorNetworkDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthErrorNetworkDto;
  }

  @override
  void update(void Function(AuthErrorNetworkDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthErrorNetworkDto build() => _build();

  _$AuthErrorNetworkDto _build() {
    final _$result = _$v ??
        new _$AuthErrorNetworkDto._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AuthErrorNetworkDto', 'message'),
            errors: BuiltValueNullFieldError.checkNotNull(
                errors, r'AuthErrorNetworkDto', 'errors'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
