import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/extensions/string_extention.dart';

import '../view_model/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});
  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Card(
            //color: Color(resources[index].colorValue), Model içerisinde yapılışı
            color: Color(resources[index]
                .color
                .colorValue), //String extension ile yazılışı
            child: Text(resources[index].name ?? ''),
          );
        },
      ),
    );
  }
}
