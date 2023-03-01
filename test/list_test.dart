import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('List best of', () {
    List<GenericUser> users = [
      const GenericUser('mbe1', '1', 10),
      const GenericUser('mbe2', '2', 20),
      const GenericUser('mbe3', '3', 30),
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('mbe1'),
        orElse: () {
          return const GenericUser('name', 'id', 1);
        },
      );
      print(response.money);
    } catch (e) {
      print(e);
    }

    print('${users.where((element) => element.money > 5)}');

    users.addAll([const GenericUser('mbe1', '1', 10)]);
    users.lastWhere((element) => element.id == '2');

    users.take(5);

    users.remove(const GenericUser('mbe1', '1', 10));
    users.removeAt(2);
    users.removeWhere((element) => element.id == '1');

    users.indexOf(const GenericUser('mbe1', '1', 10));

    final result = users.indexWhere((element) => element.id == '1');
    if (result >= 0) {
      users[result] = const GenericUser('mbe1', '1', 50);
    }

    users.map((e) => e.money).where((element) => element > 5);
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      const GenericUser('mbe1', '1', 10),
      const GenericUser('mbe2', '2', 20),
      const GenericUser('mbe3', '3', 30),
    ];

    final response =
        users.singleWhereOrNull((element) => element.findUserName('name'));

    print(response);

    users.lastOrNull;
    users.forEachIndexed((index, element) {});

    users.sample(2);

    users.contains(const GenericUser('mbe1', '1', 10));
  });
}
