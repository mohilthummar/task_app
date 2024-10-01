import 'package:get_storage/get_storage.dart';

/// Utility class for handling local storage operations.
class Preferences {
  static const String _user = "user";
  static const String _deviceId = "deviceId";
  static const String _isLogged = 'isLogged';
  static const String _token = 'token';
  static const String _perPage = 'perPage';

  /// Store phone FCM token
  static set deviceId(String? value) => GetStorage().write(_deviceId, value);

  /// Get phone FCM token
  static String? get deviceId => GetStorage().read(_deviceId);

  /// Store is user login or logout
  static set isLogged(bool value) => GetStorage().write(_isLogged, value);

  /// Get is user is login or logout
  static bool get isLogged => GetStorage().read(_isLogged) ?? false;

  /// Store user login token
  static set token(String? value) => GetStorage().write(_token, value);

  /// Get user login token
  static String? get token => GetStorage().read(_token);

  /// Store item per page show count
  static set perPage(int? value) => GetStorage().write(_perPage, value);

  /// Get item per page show count
  static int? get perPage => GetStorage().read(_perPage);

  /// Store user data (Put user model)
  // static set user(UserModel value) {
  //   final String encodedValue = jsonEncode(value);
  //   final GetStorage storage = GetStorage();
  //   storage.write(_user, encodedValue);
  // }

  /// get user data (Put user model)
  // static UserModel get user {
  //   final storage = GetStorage();
  //   final dynamic result = storage.read(_user);
  //   return UserModel.fromJson(json.decode(result));
  // }

  /// Remove all user data and token
  static void logout() {
    final GetStorage storage = GetStorage();
    storage.write(_isLogged, false);
    storage.write(_token, null);
    storage.write(_user, null);
  }
}
