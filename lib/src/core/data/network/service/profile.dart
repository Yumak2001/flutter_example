import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/client.dart';
import 'package:faneron_mobile/src/core/data/network/entities/response.dart';
import 'package:faneron_mobile/src/core/data/network/entities/user.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileService {
  Future<UserNetworkDto?> myProfileUpdate();
  Future<ResponseData?> getMyTickets();
  Future<bool?> updatePhotoProfile(String filePath);
  Future<bool?> updateProfileData({
    required String firstName,
    required String surName,
    List<int>? interest,
    String? city,
    String? age,
  });
}

@Injectable(as: ProfileService)
class ProfileServiceImpl implements ProfileService {
  final Api api;
  ProfileServiceImpl(this.api);

  @override
  Future<UserNetworkDto?> myProfileUpdate() async {
    try {
      var data = await api.client.get(
        '/profile',
      );
      if (data.statusCode == 200) {
        return UserNetworkDto.fromJson(Map<String, dynamic>.from(data.data)['data']);
      } else {
        return null;
      }
    } catch (e) {
      Log.error(e.toString());
      return null;
    }
  }

  @override
  Future<ResponseData?> getMyTickets() async {
    try {
      var data = await api.client.get(
        '/profile/tickets',
      );
      if (data.statusCode == 200) {
        return ResponseData.fromJson(Map<String, dynamic>.from(data.data));
      } else {
        return null;
      }
    } catch (e) {
      Log.error(e.toString());
      return null;
    }
  }

  @override
  Future<bool?> updatePhotoProfile(String filePath) async {
    try {
      FormData formData = FormData.fromMap({
        "visitor-photo": await MultipartFile.fromFile(filePath, filename: 'image.jpg'),
      });
      var data = await api.client.post('/profile/photo/update', data: formData);
      if (data.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      Log.error(e.toString());
      return null;
    }
  }

  @override
  Future<bool?> updateProfileData({
    required String firstName,
    required String surName,
    List<int>? interest,
    String? city,
    String? age,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'visitor-firstname': firstName,
        'visitor-surname': surName,
      };
      if (interest != null) {
        interest.forEach((element) {
          queryParameters.addAll({
            'visitor-interests[]': json.decode(json.encode(interest)),
          });
        });
      }
      if (city != null) {
        queryParameters.addAll({'visitor-city': city});
      }
      if (age != null) {
        queryParameters.addAll({'visitor-age': age});
      }
      Log.info(queryParameters.toString());
      var data = await api.client.post('/profile/personal/update', queryParameters: queryParameters);
      if (data.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Log.error(e.toString());
      return null;
    }
  }
}
