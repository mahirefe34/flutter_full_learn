import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_manager.dart';

import '../user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(final List<User> items) async {
    //Compute
    final itemsList =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, itemsList);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringItems(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final jsonObject = jsonDecode(element);
        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
