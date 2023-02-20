import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({super.key});

  @override
  State<ServicePostLearnView> createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  String? name;
  bool _isLoading = false;
  late final Dio _networkManager;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final responce = await _networkManager.post('posts', data: postModel);

    if (responce.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox.shrink(),
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'UserId'),
              textInputAction: TextInputAction.next,
            ),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text),
                          );
                          _addItemToService(model);

                          // Video 9 Dakika 1:11:00 da kaldım
                        }
                      },
                child: const Text('Send')),
          ],
        ));
  }
}
