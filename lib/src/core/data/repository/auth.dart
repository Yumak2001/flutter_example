import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth.dart';
import 'package:faneron_mobile/src/core/data/network/entities/auth_error.dart';
import 'package:faneron_mobile/src/core/data/network/service/auth.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:faneron_mobile/src/core/data/storage/tickets.dart';
import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/domain/repository/auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final UserDataStorage userStorage;
  final EventsDataStorage eventsDataStorage;
  final TicketsDataStorage ticketsDataStorage;
  AuthRepositoryImpl(
    this.authService,
    this.userStorage,
    this.eventsDataStorage,
    this.ticketsDataStorage,
  ) {
    if (userStorage.isAuth) {
      refresh();
    }
  }

  @override
  Future<bool> login({required String email, required String password}) async {
    var result = await authService.login(email: email, password: password);
    if (result is AuthNetworkDto) {
      userStorage.logIn(result.toDomain);
      return true;
    } else if (result is AuthErrorNetworkDto) {
      Log.error(result.toString());
      return false;
    } else {
      return false;
    }
  }

  @override
  Future<void> refresh() async {
    if (DateTime.now().difference(userStorage.lastUpdateToken!).inSeconds < userStorage.expiresIn!) {
      if (DateTime.now().difference(userStorage.lastUpdateToken!).inSeconds > 1000) {
        var result = await authService.refresh();
        if (result is AuthNetworkDto) {
          userStorage.logIn(result.toDomain);
        } else if (result is AuthErrorNetworkDto) {
          Log.error(result.toString());
        }
      }
    } else {
      logOut();
    }
  }

  @override
  Future<bool> register({
    required String firstName,
    required String surName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String city,
    required int age,
  }) async {
    var result = await authService.register(
      firstName: firstName,
      surName: surName,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      city: city,
      age: age,
    );
    if (result is AuthNetworkDto) {
      userStorage.logIn(result.toDomain);
      return true;
    } else if (result is AuthErrorNetworkDto) {
      Log.error(result.toString());
      return false;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    authService.logOut();
    userStorage.logOut();
    ticketsDataStorage.clear();
    eventsDataStorage.eventTicketsList = [];
    eventsDataStorage.eventsPayIdList = [];
    Log.info('logOut is success');
    return true;
  }

  @override
  Future<bool> resetPass(String email) async {
    return await authService.resetPass(email);
  }

  @override
  Future<bool> editPass({
    required String editPass,
    required String editPassNew,
    required String editPassNewRepeat,
  }) async {
    var result = await authService.editPass(
      editPass: editPass,
      editPassNew: editPassNew,
      editPassNewRepeat: editPassNewRepeat,
    );
    if (result) {
      refresh();
      return true;
    } else if (result is AuthErrorNetworkDto) {
      Log.error(result.toString());
      return false;
    } else {
      return false;
    }
  }
}
