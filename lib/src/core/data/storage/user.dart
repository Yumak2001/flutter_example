import 'package:faneron_mobile/src/core/data/network/entities/user.dart';
import 'package:faneron_mobile/src/core/domain/entities.dart';
import 'package:faneron_mobile/src/core/domain/entities/interest_profile.dart';
import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'user.g.dart';

abstract class UserDataStorage {
  ///Is the user logged in to the current application session
  late bool isAuth;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  DateTime? lastUpdateToken;
  late InterestProfileStorage interestProfile;
  UserStorage? user;
  Future<int> clear();
  Stream<bool> get watchIsAuth;
  Stream<InterestProfileStorage> get interestProfileWatch;
  Stream<UserDomain?> get watchUser;
  Future<void> logOut();
  Future<void> logIn(AuthDomain user);
  late bool isOnBoardingNeeded;
}

@Injectable(as: UserDataStorage)
class AuthStorageHive implements UserDataStorage {
  static const _hiveBoxName = 'user';

  ///Box
  Box get _hiveBox => Hive.box(_hiveBoxName);

  AuthStorageHive() {
    _hiveBox.watch().listen((event) {
      if (event.key == _Keys.isAuth.name) {
        _watchIsAuthController.add(event.value as bool);
      } else if (event.key == _Keys.interestProfile.name) {
        _watchInterestProfileController.add(event.value as InterestProfileStorage);
      } else if (event.key == _Keys.userData.name) {
        if (event.value == null) {
          _watchUserController.add(null);
        }
        _watchUserController.add((event.value as UserStorage).toDomain);
      }
    });
    _watchIsAuthController.add(isAuth);
    _watchUserController.add(user?.toDomain);
    _watchInterestProfileController.add(interestProfile);
  }

  static Future init() async {
    await Hive.openBox(_hiveBoxName);
  }

  ///Streams
  final _watchIsAuthController = BehaviorSubject<bool>();
  final _watchInterestProfileController = BehaviorSubject<InterestProfileStorage>();
  final _watchUserController = BehaviorSubject<UserDomain?>();

  @override
  Stream<bool> get watchIsAuth => _watchIsAuthController.stream;
  @override
  Stream<InterestProfileStorage> get interestProfileWatch => _watchInterestProfileController.stream;
  @override
  Stream<UserDomain?> get watchUser => _watchUserController.stream;

  ///Getters
  bool get isAuth {
    var data = _hiveBox.get(_Keys.isAuth.name);
    if (data == null) {
      data = false;
      _hiveBox.put(_Keys.isAuth.name, data);
    }
    return data;
  }

  String? get accessToken {
    return _hiveBox.get(_Keys.accessToken.name);
  }

  String? get tokenType {
    return _hiveBox.get(_Keys.tokenType.name);
  }

  int? get expiresIn {
    return _hiveBox.get(_Keys.expiresIn.name);
  }

  DateTime? get lastUpdateToken {
    return DateTime.tryParse(_hiveBox.get(_Keys.lastUpdateToken.name));
  }

  InterestProfileStorage get interestProfile {
    var data = _hiveBox.get(_Keys.interestProfile.name);
    if (data == null) {
      data = InterestProfileStorage();
      _hiveBox.put(_Keys.interestProfile.name, data);
    }
    return data;
  }

  bool get isOnBoardingNeeded {
    return _hiveBox.get(
      _Keys.isOnBoardingNeeded.name,
      defaultValue: true,
    );
  }

  UserStorage? get user {
    var data = _hiveBox.get(_Keys.userData.name);
    return data;
  }

  ///Setters
  set isAuth(bool data) {
    _hiveBox.put(_Keys.isAuth.name, data);
  }

  set accessToken(String? data) {
    _hiveBox.put(_Keys.accessToken.name, data);
  }

  set tokenType(String? data) {
    _hiveBox.put(_Keys.tokenType.name, data);
  }

  set expiresIn(int? data) {
    _hiveBox.put(_Keys.expiresIn.name, data);
  }

  set lastUpdateToken(DateTime? data) {
    _hiveBox.put(_Keys.lastUpdateToken.name, (data != null) ? data.toString() : null);
  }

  set interestProfile(InterestProfileStorage data) {
    _hiveBox.put(_Keys.interestProfile.name, data);
  }

  set user(UserStorage? data) {
    _hiveBox.put(_Keys.userData.name, data);
  }

  set isOnBoardingNeeded(bool value) {
    _hiveBox.put(
      _Keys.isOnBoardingNeeded.name,
      value,
    );
  }

  Future<void> logIn(AuthDomain user) async {
    accessToken = user.accessToken;
    tokenType = user.tokenType;
    expiresIn = user.expiresIn;
    lastUpdateToken = DateTime.now();
    isAuth = true;
  }

  Future<void> logOut() async {
    accessToken = null;
    tokenType = null;
    expiresIn = null;
    lastUpdateToken = null;
    isAuth = false;
    interestProfile.clean();
    user = null;
  }

  Future<int> clear() async {
    return await _hiveBox.clear();
  }
}

enum _Keys {
  isAuth,
  accessToken,
  tokenType,
  expiresIn,
  lastUpdateToken,
  interestProfile,
  isOnBoardingNeeded,
  userData,
}

@HiveType(typeId: 0)
class InterestProfileStorage extends HiveObject {
  @HiveField(0)
  bool music;
  @HiveField(1)
  bool comics;
  @HiveField(2)
  bool painting;
  @HiveField(3)
  bool games;
  @HiveField(4)
  bool books;
  @HiveField(5)
  bool technologies;
  @HiveField(6)
  bool newKnowledge;
  @HiveField(7)
  bool cityEvents;

  InterestProfileStorage({
    this.music = false,
    this.comics = false,
    this.painting = false,
    this.games = false,
    this.books = false,
    this.technologies = false,
    this.newKnowledge = false,
    this.cityEvents = false,
  });

  InterestProfileDomain get toDomain => InterestProfileDomain(
        music: this.music,
        comics: this.comics,
        painting: this.painting,
        games: this.games,
        books: this.books,
        technologies: this.technologies,
        newKnowledge: this.newKnowledge,
        cityEvents: this.cityEvents,
      );

  static InterestProfileStorage fromNetwork(List<InterestDto> data) {
    return InterestProfileStorage(
      music: data.indexWhere((element) => element.id.toString() == '1') != -1,
      comics: data.indexWhere((element) => element.id.toString() == '2') != -1,
      painting: data.indexWhere((element) => element.id.toString() == '3') != -1,
      games: data.indexWhere((element) => element.id.toString() == '4') != -1,
      books: data.indexWhere((element) => element.id.toString() == '5') != -1,
      technologies: data.indexWhere((element) => element.id.toString() == '6') != -1,
      newKnowledge: data.indexWhere((element) => element.id.toString() == '7') != -1,
      cityEvents: data.indexWhere((element) => element.id.toString() == '8') != -1,
    );
  }

  void replace(InterestProfileDomain interest) {
    this.music = interest.music;
    this.comics = interest.comics;
    this.painting = interest.painting;
    this.games = interest.games;
    this.books = interest.books;
    this.technologies = interest.technologies;
    this.newKnowledge = interest.newKnowledge;
    this.cityEvents = interest.cityEvents;
    this.save();
  }

  void clean() {
    this.music = false;
    this.comics = false;
    this.painting = false;
    this.games = false;
    this.books = false;
    this.technologies = false;
    this.newKnowledge = false;
    this.cityEvents = false;
    this.save();
  }
}

@HiveType(typeId: 5)
class UserStorage {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String surName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? city;
  @HiveField(4)
  String? age;
  @HiveField(5)
  String? imageUrl;

  UserStorage({
    required this.firstName,
    required this.surName,
    required this.email,
    required this.city,
    required this.age,
    required this.imageUrl,
  });

  UserDomain get toDomain => UserDomain(
        email: email,
        firstName: firstName,
        surName: surName,
        city: city,
        age: age,
        photo: imageUrl,
      );
}
