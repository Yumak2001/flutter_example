import 'package:faneron_mobile/src/core/data/network/entities/data.dart';
import 'package:faneron_mobile/src/core/data/network/entities/included.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ResponseData {
  final List<DataResponseDto> data;
  final List<IncludedDto> included;

  ResponseData({
    required this.data,
    required this.included,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
}
