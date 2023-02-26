import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User Calculate', () {
    final users = [
      GenericUser('mbe1', '1', 10),
      GenericUser('mbe2', '2', 20),
      GenericUser('mbe3', '3', 30),
    ];

    final result =
        UserManagement(AdminUser('admin', '0', 10, 1)).calculateMoney(users);

    final responce =
        UserManagement(AdminUser('admin', '0', 10, 1)).showNames<String>(users);

    expect(result, 70);
  });
}
