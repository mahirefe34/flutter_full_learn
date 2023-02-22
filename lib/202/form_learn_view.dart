import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController1,
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              controller: textEditingController2,
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : 'Bu alan boş geçilemez';
              },
            ),
            DropdownButtonFormField(
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(value: '1', child: Text('a')),
                DropdownMenuItem(value: '2', child: Text('b')),
              ],
              onChanged: (value) {},
            ),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Bu alan boş geçilemez';
  }
}
