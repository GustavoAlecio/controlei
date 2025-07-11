import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/src/data/data.dart';

class SharedPreferencesLocalStorage implements ILocalStorage<AccountModel> {
  static const _key = 'accounts_storage';

  final FutureOr<SharedPreferences> _prefs;

  SharedPreferencesLocalStorage(this._prefs);

  @override
  Future<void> save(AccountModel item) async {
    final all = await getAll();
    final updated = [...all, item];
    await _save(updated);
  }

  @override
  Future<void> delete(String id) async {
    final all = await getAll();
    final updated = all.where((acc) => acc.id != id).toList();
    await _save(updated);
  }

  @override
  Future<List<AccountModel>> getAll() async {
    final preferences = await _prefs;
    final jsonString = preferences.getString(_key);
    if (jsonString == null) return [];
    final List decoded = json.decode(jsonString);
    return decoded.map((e) => AccountModel.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> update(AccountModel item) async {
    final all = await getAll();
    final updated = all.map((acc) => acc.id == item.id ? item : acc).toList();
    await _save(updated);
  }

  Future<void> _save(List<AccountModel> accounts) async {
    final preferences = await _prefs;
    final encoded = json.encode(accounts.map((e) => e.toJson()).toList());
    await preferences.setString(_key, encoded);
  }

  @override
  Future<AccountModel?> getById(id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
