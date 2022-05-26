import 'package:get_storage/get_storage.dart';

mixin AuthCacheManager {
  var authBox = GetStorage();

  Future<bool> saveLoginInfo(
    token,
    email,
    id,
    name,
    role,
    score,
    birthDay,
    profilePhoto,
    phone,
    tokenType,
    expiresAt,
  ) async {
    try {
      await authBox.write(
          LoginCacheManagerKey.token.toString(), token.toString());
      await authBox.write(
          LoginCacheManagerKey.email.toString(), email.toString());
      await authBox.write(
          LoginCacheManagerKey.name.toString(), name.toString());
      await authBox.write(
          LoginCacheManagerKey.userId.toString(), id.toString());
      await authBox.write(
          LoginCacheManagerKey.role.toString(), role.toString());
      await authBox.write(
          LoginCacheManagerKey.birthDay.toString(), birthDay.toString());
      await authBox.write(LoginCacheManagerKey.profilePhoto.toString(),
          profilePhoto.toString());
      await authBox.write(
          LoginCacheManagerKey.phone.toString(), phone.toString());
      await authBox.write(
          LoginCacheManagerKey.tokenType.toString(), tokenType.toString());
      await authBox.write(
          LoginCacheManagerKey.expiresAt.toString(), expiresAt.toString());
    } catch (e) {
      print('$e -------- Login User cache isleminde problem olustu.');
      return false;
    }
    return true;
  }

  Future<void> removeUserCacheInfo() async {
    await authBox.remove(LoginCacheManagerKey.token.toString());
    await authBox.remove(LoginCacheManagerKey.email.toString());
    await authBox.remove(LoginCacheManagerKey.name.toString());
    await authBox.remove(LoginCacheManagerKey.userId.toString());
    await authBox.remove(LoginCacheManagerKey.role.toString());
    await authBox.remove(LoginCacheManagerKey.birthDay.toString());
    await authBox.remove(LoginCacheManagerKey.profilePhoto.toString());
    await authBox.remove(LoginCacheManagerKey.phone.toString());
    await authBox.remove(LoginCacheManagerKey.tokenType.toString());
    await authBox.remove(LoginCacheManagerKey.expiresAt.toString());
  }

  getToken() => authBox.read(LoginCacheManagerKey.token.toString());
  getEmail() => authBox.read(LoginCacheManagerKey.email.toString());
  getName() => authBox.read(LoginCacheManagerKey.name.toString());
  getUserId() => authBox.read(LoginCacheManagerKey.userId.toString());
  getRole() => authBox.read(LoginCacheManagerKey.role.toString());
  getBirthDay() => authBox.read(LoginCacheManagerKey.birthDay.toString());
  getProfilePhoto() =>
      authBox.read(LoginCacheManagerKey.profilePhoto.toString());
  getPhone() => authBox.read(LoginCacheManagerKey.phone.toString());
  getTokenType() => authBox.read(LoginCacheManagerKey.tokenType.toString());
  getExpressAt() => authBox.read(LoginCacheManagerKey.expiresAt.toString());
}

enum LoginCacheManagerKey {
  token,
  userId,
  email,
  name,
  role,
  score,
  birthDay,
  profilePhoto,
  phone,
  tokenType,
  expiresAt
}
