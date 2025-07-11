import 'package:core/src/data/data.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

final accountLocalStorageProvider =
    Provider<ILocalStorage<AccountModel>>((ref) {
  return SharedPreferencesLocalStorage(SharedPreferences.getInstance());
});
