class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var user in users) {
      sum += user.money;
    }

    final sumMoney = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    final initialValue = admin.role == 1 ? admin.money : 0;

    final money = users.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);

    return money;
  }

  Iterable<R>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => e.name).cast<R>();
      return names;
    }
    return null;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;

  AdminUser(String name, String id, int money, this.role)
      : super(name, id, money);
}
