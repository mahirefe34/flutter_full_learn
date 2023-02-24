import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class SharedLearnWithManager extends StatefulWidget {
  const SharedLearnWithManager({super.key});

  @override
  State<SharedLearnWithManager> createState() => _SharedLearnWithManagerState();
}

class _SharedLearnWithManagerState
    extends LoadingStateful<SharedLearnWithManager> {
  late final SharedManager _manager;
  int _currentValue = 0;

  void _onChangeValue(String value) {
    final value0 = int.tryParse(value);
    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  void getValue() {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  Future<void> _initializeShared() async {
    changeLoading();
    await _manager.init();
    getValue();
    changeLoading();
  }

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initializeShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ))
              : const SizedBox.shrink(),
        ],
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
        onPressed: () async {
          changeLoading();
          await _manager.saveString(
              SharedKeys.counter, _currentValue.toString());
          changeLoading();
        },
        child: const Icon(Icons.save));
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
        onPressed: () async {
          changeLoading();
          await _manager.removeString(SharedKeys.counter);
          changeLoading();
        },
        child: const Icon(Icons.remove_circle_outline_outlined));
  }
}

//Generic type <T>
abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
