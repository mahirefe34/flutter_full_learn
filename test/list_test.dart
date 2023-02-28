import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('List best of', () {
    List<GenericUser> users = [
      GenericUser('mbe1', '1', 10),
      GenericUser('mbe2', '2', 20),
      GenericUser('mbe3', '3', 30),
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('mbe1'),
        orElse: () {
          return GenericUser('name', 'id', 1);
        },
      );
      print(response.money);
    } catch (e) {
      print(e);
    }

    print('${users.where((element) => element.money > 5)}');
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      GenericUser('mbe1', '1', 10),
      GenericUser('mbe2', '2', 20),
      GenericUser('mbe3', '3', 30),
    ];

    final response =
        users.singleWhereOrNull((element) => element.findUserName('name'));

    print(response);
    // expect(result, 70);
  });
}
