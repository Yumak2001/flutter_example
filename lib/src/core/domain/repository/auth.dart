abstract class AuthRepository {
  Future<bool> login({required String email, required String password});
  Future<bool> register({
    required String firstName,
    required String surName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String city,
    required int age,
  });
  Future<void> logOut();
  Future<bool> resetPass(String email);
  Future<void> refresh();
  Future<bool> editPass({
    required String editPass,
    required String editPassNew,
    required String editPassNewRepeat,
  });
}
