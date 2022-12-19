import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/client.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth_error.dart';
import 'package:injectable/injectable.dart';

abstract class AuthService {
  Future<Object?> login({
    required String email,
    required String password,
  });
  Future<Object?> refresh();
  Future<Object?> register({
    required String firstName,
    required String surName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String city,
    required int age,
  });
  Future<bool> logOut();
  Future<bool> resetPass(String email);
  Future<bool> editPass({
    required String editPass,
    required String editPassNew,
    required String editPassNewRepeat,
  });
}

@Injectable(as: AuthService)
class AuthServiceImpl implements AuthService {
  final Api api;
  AuthServiceImpl(this.api);

  @override
  Future<Object?> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await api.client.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (result.statusCode == 200) {
        return AuthNetworkDto.fromJson(Map.from(result.data));
      } else {
        if (result.statusCode == 422) {
          return AuthErrorNetworkDto.fromJson(Map.from(result.data));
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Object?> refresh() async {
    try {
      final result = await api.client.post(
        '/auth/refresh',
      );
      if (result.statusCode == 200) {
        return AuthNetworkDto.fromJson(Map.from(result.data));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Object?> register({
    required String firstName,
    required String surName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String city,
    required int age,
  }) async {
    try {
      final result = await api.client.post(
        '/auth/register',
        data: {
          "reg-firstname": firstName,
          "reg-surname": surName,
          "reg-email": email,
          "reg-password": password,
          "reg-password_confirmation": passwordConfirm,
          "reg-city": city,
          "reg-age": age,
        },
      );
      if (result.statusCode == 200) {
        return AuthNetworkDto.fromJson(Map.from(result.data));
      } else {
        if (result.statusCode == 422) {
          return AuthErrorNetworkDto.fromJson(Map.from(result.data));
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> logOut() async {
    try {
      final result = await api.client.post(
        '/auth/logout',
      );
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> resetPass(String email) async {
    try {
      final result = await api.client.post(
        '/password/forgot',
        data: {
          'user-email': email,
        },
      );
      Log.info(result.statusCode.toString());
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> editPass({
    required String editPass,
    required String editPassNew,
    required String editPassNewRepeat,
  }) async {
    try {
      final result = await api.client.post(
        '/profile/password/update',
        data: {
          'user-old-password': editPass,
          'user-password': editPassNew,
          'user-password_confirmation': editPassNewRepeat,
        },
      );
      Log.info(result.statusCode.toString());
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
