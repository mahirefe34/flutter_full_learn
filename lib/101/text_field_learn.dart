import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              hintText: 'mail@example.com',
              labelText: 'Mail',
              filled: true,
              fillColor: Colors.amber,
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          const TextField(
            maxLength: 20,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          TextField(
            maxLength: 20,
            buildCounter: (context,
                {int? currentLength, bool? isFocused, maxLength}) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 10,
                width: 10.0 * (currentLength ?? 0),
                color: Colors.green[100],
                //color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 10),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            minLines: 2,
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          const TextField(
            keyboardType: TextInputType.phone,
            autofillHints: [AutofillHints.telephoneNumber],
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
