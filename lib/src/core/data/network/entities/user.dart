import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: false)
class UserNetworkDto {
  final String email;
  final String firstname;
  final String surname;
  @JsonKey(name: "photo-url")
  final String? photo_url;
  final String? city;
  final String? age;
  final InterestsDto interests;

  UserNetworkDto({
    required this.email,
    required this.firstname,
    required this.surname,
    required this.photo_url,
    required this.city,
    required this.age,
    required this.interests,
  });

  factory UserNetworkDto.fromJson(Map<String, dynamic> json) => _$UserNetworkDtoFromJson(json);

  UserStorage get toStorage => UserStorage(
        email: email,
        firstName: firstname,
        surName: surname,
        imageUrl: 'https://faneron.ru' + (photo_url ?? ''),
        city: city,
        age: age,
      );
}

@JsonSerializable(createToJson: false)
class InterestsDto {
  final List<InterestDto> data;

  InterestsDto({
    required this.data,
  });

  factory InterestsDto.fromJson(Map<String, dynamic> json) => _$InterestsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class InterestDto {
  final dynamic id;
  final String title;

  InterestDto({
    required this.id,
    required this.title,
  });

  factory InterestDto.fromJson(Map<String, dynamic> json) => _$InterestDtoFromJson(json);
}
