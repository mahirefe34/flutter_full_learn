import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});

  final String _title = 'Welcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),

        //Temadan Geliyor.
        /* centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle
            .light, //saat ve wifi gibi işaretlerin tema rengi */

        leading: const Icon(Icons.chevron_left),
        // automaticallyImplyLeading: false,    //Back butonu otomatik gelmesin.
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mark_email_unread_outlined)),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
