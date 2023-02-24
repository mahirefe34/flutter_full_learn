import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys { token }

class _SecureContextLearnState extends State<SecureContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  final TextEditingController _controller = TextEditingController();
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if (_title.isNotEmpty) {
      print('token mevcut ilk giriş değil');
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
      ),
      body: TextField(
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
        controller: _controller,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),
      ),
    );
  }
}
