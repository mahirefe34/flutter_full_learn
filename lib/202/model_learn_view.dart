import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(title: 'MBE');

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..body = 'mbe'
      ..id = 1;
    user1.body = 'user 1 body';

    final user2 = PostModel2(1, 2, 'title', 'body');
    user2.body = 'body change';

    final user3 = PostModel3(1, 2, 'a', 'b');
    // user3.body = 'ab'; model final tanımlandığı için daha sonra değişiklik yapılamaz.

    //Localde çalışan için iyi.
    final user4 = PostModel4(userId: 1, id: 2, title: 'title', body: 'body');
    //user4.body = ''; model final tanımlandığı için daha sonra değişiklik yapılamaz.

    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    //user5. dediğimizde modelde private tanımlandığı için gözükmez.
    //print(user5.userId); Getter metod yazılarak ulaşılabilir.

    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');

    final user7 = PostModel7();

    //Service den data geliyorsa.
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user9.title ?? 'No data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(
              title: 'title',
            );
            user9.updateBody('data');
          });
        },
      ),
    );
  }
}
