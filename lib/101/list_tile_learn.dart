import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('My Card'),
              subtitle: const Text('How do you do?'),
              leading: const Icon(Icons.medical_information_outlined),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {},
              dense: true, //olabildiğince sıkıştırmayı sağlıyor.
              contentPadding: EdgeInsets
                  .zero, //Default  paddingleri sıfırlar. //Bu işlem thema dan yapılmalı
            ),
          ),
        ],
      ),
    );
  }
}
