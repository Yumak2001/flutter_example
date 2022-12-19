// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNetworkDto _$UserNetworkDtoFromJson(Map<String, dynamic> json) =>
    UserNetworkDto(
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      surname: json['surname'] as String,
      photo_url: json['photo-url'] as String?,
      city: json['city'] as String?,
      age: json['age'] as String?,
      interests:
          InterestsDto.fromJson(json['interests'] as Map<String, dynamic>),
    );

InterestsDto _$InterestsDtoFromJson(Map<String, dynamic> json) => InterestsDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => InterestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

InterestDto _$InterestDtoFromJson(Map<String, dynamic> json) => InterestDto(
      id: json['id'],
      title: json['title'] as String,
    );
